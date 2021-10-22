Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A48934375F8
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 13:27:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215012.373928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdsge-00065h-Pl; Fri, 22 Oct 2021 11:26:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215012.373928; Fri, 22 Oct 2021 11:26:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdsge-00063s-M8; Fri, 22 Oct 2021 11:26:12 +0000
Received: by outflank-mailman (input) for mailman id 215012;
 Fri, 22 Oct 2021 11:26:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OBiv=PK=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mdsgd-00063m-Sg
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 11:26:11 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4ebca68-5d81-4002-8bbf-538943c4274f;
 Fri, 22 Oct 2021 11:26:09 +0000 (UTC)
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
X-Inumbo-ID: b4ebca68-5d81-4002-8bbf-538943c4274f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634901969;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=AAfPA40WOWEyya45gGTieJLd1u4lWcvP3ksEUlvRzfs=;
  b=a2QzHudWGKGjq+ha1Kz8Mx9B4eZWcv8uYodAaOgggrxv5loxX1vwMafz
   gV7EyDgDfjvYsTF/QoC71c/HLmRtSUMdTK0F3IHabp9bvv2vLYA1FE8Ks
   Hq7OuXbQCcti3zbbDuTkbjhIRaFHJWfv9xCSHoFJLe75Qrkp1gDM+MaU/
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: DW9A3j3vcSOHlS8ptH3kp97QhuS52lX3yuuxgzsXRm4/HtnBEv7g3AtG/oLmENFIBhw9QM04pQ
 ymT9PRXb/SVrMiGRoDUJhHjiuwcb4RKNLDEPl1hz0Os+E8YhW3gxhPG30WoWJxDp3pF7wxJcQp
 Gr8FKW51SC8mcNRvYejvQ+1Z/u1faKT9q6O1cUAPEFVKCdi9Z1GdjLI4CVhcle0xC3ZlKP5/84
 qM1vfjGFW44gc9WD1/3W8UdWdCgrZ1voPIxcwyLtztrOJvF1F9KZ9glZcaqouQvZr5dB2SBzry
 yZzDGhyAvJQHW0mcCJNT+oFo
X-SBRS: 5.1
X-MesageID: 57735148
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:0l0I7Klc4lvZhidZVkN/C1/o5gwbIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIaWGqEbvqKMWL1L9gkbty38RkHscfWn9BnSwBqpH9hRCMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg2tQy2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 ItdsZbsezwkAoP3t8gTYiZ5CAp5NrITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQKmBP
 JdANWoHgBLoRRFOO0k0B4MFvOaYuUnkS2129WLPqv9ii4TU5FMoi+W8WDbPQfSIT8hImkeTp
 krd4n/0RBodMbS3yCWH2mKhgPfVmiH2U55UE6e3ntZ6jVvWymENBRk+UVqgveL/mkO4Q8hYK
 UEf5mwpt6da3FOvZsnwWVu/unHslgUHR9NaHuk+6QeM4qnZ+QCUAi4DVDEpQN47sM47QxQ62
 1nPmMnmbQGDq5XMFyjbrO3N62rvZ25FdgfueBPoUyNb893p/LMIgy7hdflPHp+Kr8beHjrvl
 mXiQDcFu50fissC1qOe9F/Bgi6xqpWhcjPZ9jk7TUr+sVsnPN/Ni5iArAGBt64Zfdnxokyp5
 SBcw6CjAPYy4YZhfcBnaN4GG621/L67OTnYjE8H83IJpmn1pSDLkWy95lhDyKZV3iQsJWCBj
 Kz741o5CHpv0J2CN/Mfj2WZUJxC8EQYPY65Ps04l/IXCnSLSCeJ/Tt1eWmb1H33nU4nnMkXY
 MnALZbwVClKUf86nVJaotvxN5dxmkjSIkuIHfjGI+mPi+LCNBZ5t59VWLdxUgzJxPzd+1iEm
 zquH8CL1w9eQIXDjtr/quYuwaQxBSFjX/je8pUPHsbae1YOMDxxWpf5nOJ6E6Q4zvs9qws91
 izkMqOu4AGk3iOvxMTjQi0LVY4Dqr4m/CtlZ3R1YA70s5XhCK72hJoim1IMVeBP3MRozOJuT
 ulDfMOFA/9VTS/A9ShbZp74xLGOvjzy7e5XFyb6MjU5YbB6QAnFpo3tcgf1rXFcBSurr8ou5
 ban01qDE5YEQg1jCufQae6ukAzt7SRMxroqUhuaOMRXdWXt7JNud377gMgoLpxeMh7E3Dabi
 VqbWE9KuenXroYp29DVnqTY/ZyxGu5zExMCTWnW5Lq7LwfA+W+nzdMSWeqEZ2mFBmj15L+jd
 aNeyPSlaK8Lm1NDsoxdFbd3zP1hu4uz9uEClgk9RSfFdVWmDL9kM0Kq58gXu/0f3KJdtCu3R
 lmLpotQN4KWNZ63C1UWPgckMLiOjKlGhjnI4P0pC0zm/ysrrqGfWEBfMhTQ2ixQKLx5bNEsz
 es74ZNE7gW+jlwhM8qcjzAS/GOJdyRSX6Iiv5AcIYnqlgt0lQ0SPc2CUnf7sMOVdtFBEkg2O
 TvF1qPNioNVylfGb3duR2PG2vBQhMhWtR1HpLPYy49lRjYRaicL4SBs
IronPort-HdrOrdr: A9a23:B+dYxaMTcWctBcBcT1H155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/exoS5PwPk80kqQFnbX5XI3SITUO3VHHEGgM1/qb/9SNIVyZygcZ79
 YbT0EcMqyBMbEZt7eC3ODQKb9Jq7PmgcPY9ts2jU0dKj2CA5sQnjuRYTzrcHGeKjM2YKbRWK
 Dsnfau8FGbCAoqh4mAdzQ4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kPEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 XxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72weBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJlFXv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbdrmGuhHjLkV1RUsZmRtixZJGbDfqFCgL3a79FupgE786NCr/Zv2Uvp9/oGOtB5Dq
 r/Q+JVfYp1P7orhJRGdZE8qPuMex7wqC33QRavyHTcZeo60iH22tTKCItc3pDcRHVP9upqpK
 j8
X-IronPort-AV: E=Sophos;i="5.87,172,1631592000"; 
   d="scan'208";a="57735148"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFFGfUzVVNhSplFmtHsomSoR6yiOSCDinn5mZ6n2uBQWFIADi3WsioMp7ZD3Dnc7PxuUogrZfC8JZ2X7tmr9MGNaH7wVUENZNlbxPg/4BEHANB+zSJj55gMoZzg/JRkwpRVrSZ9E/5FqmcW0F3Jc4e5ltyQA+PXBNwJen3byEprpt9a2ZKj5sL60BLSRJLbJ0gQVGz8UXauosGhKXteAnauWZQcaJo97ZGwr/XGq5bYsb8R+kziPfJHLZFXPKQvXLBBmSJ6t+tDbt/s30G7GHWZ2AMGTliMQZhj4CVeZbGdOWy9/1ipLid/Li9xEhYOwduHRb+nG5mhcmmXL3L6n9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jtw8hog5odKGwwLZXc8eLTsw5rnuoGxyp3I0UIwMhwI=;
 b=fGzSham7QhFjuFmijHKzC8slVckMTIGMRqLskjQgTL2FUm0mkTiasrtohPsUIikIE1yEKEl1o84EnxaUO+jK7kijgtXSAbD/b17CAoirTN23ft9Nq+5qs1fcLnLzLNlKkGS/9PGXZiPAxgBZj2PK9Qh8lXQysgYQk8GnvqJnfjO+XH6cOFjaYjXR5iBaNkAlFTyYmOYKeEIK6Xm/fMLikYTYoY6/rkywtJgd5s6KjmwCEkbbxaINZ72hpa2HrU217EHNz7QAN1GynheHbdPUoqE1ISbb4kBNcZ/k1d5P/pDDO+D/RL0Kdyiopf71ztq85LnrdnW9MP7DuJUutu8Wuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtw8hog5odKGwwLZXc8eLTsw5rnuoGxyp3I0UIwMhwI=;
 b=Z9wz6lLgLlAhQ1xBNf5zm7Nnxe7xUmI3TPIDlFjO/kItfAsDy4eLlp1fDsSl5saZCaspF3tOhTGJ+zJdg6eUjACDOzqq85yQ1TiVU5MOtGT7PdM5ZTJYqWfv3ZD9XNOrSo31Qy9mgzUWYjMaeh3O9xHMRV8CJTP9DT/lzu6w/tI=
Subject: Re: [PATCH v2 6/7] xen: Switch to byteswap.h
To: Lin Liu <lin.liu@citrix.com>, <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1634897942.git.lin.liu@citrix.com>
 <f5a79881bfdcef06aa950632250f551e0ec26458.1634897942.git.lin.liu@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <12550694-d66d-0555-d6c9-840d68219350@citrix.com>
Date: Fri, 22 Oct 2021 12:25:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <f5a79881bfdcef06aa950632250f551e0ec26458.1634897942.git.lin.liu@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0363.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 379dc05e-5981-4272-5ea9-08d9954eb87a
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5934:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5934049574927B27486810FABA809@SJ0PR03MB5934.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HaZrzofHXnNwkM0ga9fmixc/8WfKxi7PsGqofKIkn7tmbzZZ6gWPDQTdwX4fvw6pf3Es1ylg2J8ClEPeRHF/+iA1CbRd6KtuikBlbQZLqmyrJel8iCQHHNDlTJLPuwbpj2ggT7TtULPVXhrT8tkW5Z6QL37FmYpt+6OJLm7uLd3b9UE8pkAVfEIdnUKmaIL7o15XilohrGHjcOxCIqW+OWBaIg1tVYFCKghOzLdz97ZB/kCVZPqa9fPVFe98nPXAclDSkcym9EQVVptKTnA1BzHdyRAwhTvVgPNlo9cFxL9oFmLXpWDh7VwSJ3BEYx85zGuBJz+VOU/Izl3XzpD8P8rCk6QIelXUMmtBpxMiHQyuRQvXBGUojSSWpSllOExC1O5PVy5EmQrHvXmYDJYiQOpLkFlFsbbhnXBa17GAk0aXATPnct/sPFW9uTHt7+UMXrB1WjkN7+EilmGLWib2E5PMtqiYTEdqoUmyPMWqYuri17VIEqoiSbTK00iWUPfoeamZz2PAQ8Ra5jA6gjCLKM9cGtoXkvTaORxuITNDgVgG0CFhLuxR1jN9guMb5dwz6TjfJ4zfp1Hl5YUY9cIFf41WY2zZCJPu/l38d6AIJG6dbmfiRyvAy5cVuP5Syu+FkjvZ5jpmTt1QnCTl/aq5ZrXR3GvxIXEp0mC0DgpAj6yVDXw0FUgztiVQdIFd2BVDXhL+roB7LCYbSqtJbapiBQCVRFcvjY2JagOyaPFoEQ2HUmniiz8k2HCkh5G438sa
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(8936002)(8676002)(66476007)(6666004)(5660300002)(508600001)(4326008)(54906003)(66556008)(316002)(16576012)(31686004)(66946007)(107886003)(36756003)(86362001)(83380400001)(2616005)(6486002)(26005)(956004)(186003)(31696002)(2906002)(53546011)(82960400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWtaWU5NQnV4cGlUeEgzMTVEcDJ6SW55Szl3QThnTnUwQzNLeTFWNnd6QkJK?=
 =?utf-8?B?bUh5YlkxSWJ3NzdKQ2NyY0R4dkN3bEF1SHM4WFRlcVo0VDJTWnhMbi9sSUd3?=
 =?utf-8?B?bUI4Q3lRM0xac3VJcmpLemxDT3FhWG9IcWgxS3ZycW82Y3JsdmEvbHR2M2xU?=
 =?utf-8?B?SXFZdTNRRHk2aXI5OTBHZ0RzSk1TSThOT3ZVRzBJOFpRWFUwT1hYSncrL0gz?=
 =?utf-8?B?eXVkVWNJSUZxeVRnakFseEY0R2dNQmJIMG5iZXR2b1JYRG5IRTFpbUh0dkE4?=
 =?utf-8?B?WUlpb3dXZGxoWDJPZ2w1TllrZm1BN0JBczl3MFJ0YjBWUVNmYmVxTnRZc1VV?=
 =?utf-8?B?QXdwdDJxNW9YTlFaRy90eW9tL0JaVkxuUlFiaWtxMzh2QVg1V3FsWmoxT3dS?=
 =?utf-8?B?Q05MQmhTejNKRExSVFo4c2NMUHZaT3dzOGp6TzFzQ2I1eUZJOE1SajNrdmZI?=
 =?utf-8?B?dEIyZkdUL3NETm8wWWRsQzd1OXVXS3ZPdWxSc3pRdnBUVVFjT2t5WldFcTZN?=
 =?utf-8?B?SlhXbXdXdVgvMU1taHhwRkcxYXFOcmtLenVLYkJ3ZjVJM0JFOVQrNlBYS2tr?=
 =?utf-8?B?NGNPSEtZb2JTZUZDSUR6UlJNaG8xdDNqclNWZ0Urd0djSWFCdHpnRVB5bDBP?=
 =?utf-8?B?U3lKa0JDcE11WDNoZ2Roa3lLWXZWMUV5dmRYUEZaZS9tSDY4MDFvdlFVamNl?=
 =?utf-8?B?Si9QZXlhbWJUc2tDS0Y5YlRFM05TcHZ3akg3a2VOM0VXRCtVbExuRFFsL2Nx?=
 =?utf-8?B?cUQ2YTk2TU1QOVpWQkNrNjV2b2xCc3NleDdCb2o5MmxOaC9MSTRFaENOSGIy?=
 =?utf-8?B?bURBbzU5b3JkVkVJQkhmNEc4b1NSemdtcWRXRFU5SU40SnZuenkvL2h1dEdh?=
 =?utf-8?B?S3hvdUNtZENSNmNlTXZSRUFvd3QxMSs4dklTY0tWR0FLYjk0dy9yUWJrSU1N?=
 =?utf-8?B?Zk5ubG5WbjdDMXZ2KzUzMUNyUExhYnowdnJUUGlRNC9zT3NoNHBoWkljSWtx?=
 =?utf-8?B?MUsrWlBRV2ZwbGN4Ym9lbzVGUkROcFZraTU4dFAyMDZJZk5yV05UVGFTQ3lK?=
 =?utf-8?B?dkwwQUhuWjJMQXpoZGFIOXJPQWVNOVh3TWllUG5zZnBEb3V1c2RwblRQUEZq?=
 =?utf-8?B?NldzM0ZCSW9zUmxucTk2aDMxRnVUNWNMSDUra0NKcW43amJrcitOK09QNGdX?=
 =?utf-8?B?cFNoTzZNVFh4Qzcya25Tb3NZSDVpNGVrNlRuK085bDBOU2Fqb0RJbG5YbE5j?=
 =?utf-8?B?R0lQaGVQcVB4UXlwaUxFS0ZjNWt5ZlMreVlPYXFYNGNzWGszZ3d1cWd2Z3pu?=
 =?utf-8?B?bk44S0JqYit3N1Y0UTk1am56YklpU210Q0dYOW9lSm8wK3gyT0VLanNmYmdF?=
 =?utf-8?B?RlRBSkYwcUZNY0lYOFVmaVVwK2IzaFFEaUhhSTR6UDgrQms5SEwxR25kK0tz?=
 =?utf-8?B?NDE1WXpaMTgxNlVmR2hoL0ZHSVhtQkUzdlBFYUVnR0wwSlF0K1V4anpVNDVO?=
 =?utf-8?B?Zi9pOWQvc3lCWEVIRXFMSU16NENKbGFjR0VYNFVIcXlDU1p3SGJaSjJJcERX?=
 =?utf-8?B?TWw3RHZtTHZOdXNnazd1NjdRUEtZQUQ2bSs0eFJxcXBHVFVXZi8rR0NyT0NN?=
 =?utf-8?B?c2ZYTTJpYWgrS0t4aFJ4L3h5RHBuU3BhQ21DMlJQSXV4dXJUTGtlY1Ywdnoz?=
 =?utf-8?B?UzJzTzVQclhpSXVlUUlqeTNINHZGWVZhZjIwY09EcU5Qdm9WN2p3eUQwelpm?=
 =?utf-8?B?aFBWVTNDKy96d0dwLzVZNFdKWVZ5VGZBdnhSSndGMENORjNGTHdrZ29qTGxr?=
 =?utf-8?B?QzlCRHgwRTc5WjVhWXpRemtnbG5RTGxGdEk5YVdmK3NYSHpIVWZvSUp5SGhs?=
 =?utf-8?B?U0J2YUo1MDBPSklnZ1VSa21jWTFRUHVGQWlob0h1TmtucnVLTnppWWRHWHdG?=
 =?utf-8?Q?0MOqk9QK6NC6RJ5c2brciyjsgAn3CHlJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 379dc05e-5981-4272-5ea9-08d9954eb87a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 11:25:58.6170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: andrew.cooper3@citrix.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5934
X-OriginatorOrg: citrix.com

On 22/10/2021 11:47, Lin Liu wrote:
> Update to use byteswap.h to swap bytes.
>
> No functional chagne.
>
> Signed-off-by: Lin Liu <lin.liu@citrix.com>
> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: George Dunlap <george.dunlap@citrix.com>
> Cc: Ian Jackson <iwj@xenproject.org>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Wei Liu <wl@xen.org>
> Cc: "Roger Pau Monné" <roger.pau@citrix.com>
> ---
>  xen/common/bitmap.c                |  2 +-
>  xen/common/gdbstub.c               |  2 +-
>  xen/common/libelf/libelf-private.h |  8 ++++----
>  xen/common/lz4/defs.h              |  2 +-
>  xen/common/lzo.c                   |  2 +-
>  xen/common/unlzo.c                 |  2 +-
>  xen/common/xz/private.h            |  4 ++--
>  xen/drivers/char/ehci-dbgp.c       |  2 +-
>  xen/include/asm-x86/msi.h          |  2 +-
>  xen/include/xen/bitmap.h           |  2 +-
>  xen/include/xen/device_tree.h      |  2 +-
>  xen/include/xen/unaligned.h        | 14 +++++++-------
>  xen/lib/divmod.c                   |  2 +-
>  13 files changed, 23 insertions(+), 23 deletions(-)
>
> diff --git a/xen/common/bitmap.c b/xen/common/bitmap.c
> index 7d4551f782..be274ca04a 100644
> --- a/xen/common/bitmap.c
> +++ b/xen/common/bitmap.c
> @@ -9,10 +9,10 @@
>  #include <xen/errno.h>
>  #include <xen/bitmap.h>
>  #include <xen/bitops.h>
> +#include <xen/byteswap.h>
>  #include <xen/cpumask.h>
>  #include <xen/guest_access.h>
>  #include <xen/lib.h>
> -#include <asm/byteorder.h>
>  
>  /*
>   * bitmaps provide an array of bits, implemented using an an
> diff --git a/xen/common/gdbstub.c b/xen/common/gdbstub.c
> index 848c1f4327..3c8ed52d6b 100644
> --- a/xen/common/gdbstub.c
> +++ b/xen/common/gdbstub.c
> @@ -33,6 +33,7 @@
>  /* Resuming after we've stopped used to work, but more through luck
>     than any actual intention.  It doesn't at the moment. */
>  
> +#include <xen/byteswap.h>
>  #include <xen/lib.h>
>  #include <xen/spinlock.h>
>  #include <xen/serial.h>
> @@ -45,7 +46,6 @@
>  #include <xen/console.h>
>  #include <xen/errno.h>
>  #include <xen/delay.h>
> -#include <asm/byteorder.h>
>  
>  /* Printk isn't particularly safe just after we've trapped to the
>     debugger. so avoid it. */
> diff --git a/xen/common/libelf/libelf-private.h b/xen/common/libelf/libelf-private.h
> index 47db679966..b7089cb31b 100644
> --- a/xen/common/libelf/libelf-private.h
> +++ b/xen/common/libelf/libelf-private.h
> @@ -17,10 +17,10 @@
>  
>  #ifdef __XEN__
>  
> +#include <xen/byteswap.h>
>  #include <xen/lib.h>
>  #include <xen/libelf.h>
>  #include <xen/softirq.h>
> -#include <asm/byteorder.h>
>  #include <public/elfnote.h>
>  
>  /* we would like to use elf->log_callback but we can't because
> @@ -31,9 +31,9 @@
>     printk(fmt, ## args )
>  
>  #define strtoull(str, end, base) simple_strtoull(str, end, base)
> -#define bswap_16(x) swab16(x)
> -#define bswap_32(x) swab32(x)
> -#define bswap_64(x) swab64(x)
> +#define bswap_16(x) bswap16(x)
> +#define bswap_32(x) bswap32(x)
> +#define bswap_64(x) bswap64(x)
>  
>  #else /* !__XEN__ */
>  
> diff --git a/xen/common/lz4/defs.h b/xen/common/lz4/defs.h
> index 10609f5a53..1ce4476478 100644
> --- a/xen/common/lz4/defs.h
> +++ b/xen/common/lz4/defs.h
> @@ -9,7 +9,7 @@
>   */
>  
>  #ifdef __XEN__
> -#include <asm/byteorder.h>
> +#include <xen/byteswap.h>
>  #include <asm/unaligned.h>
>  #else
>  
> diff --git a/xen/common/lzo.c b/xen/common/lzo.c
> index a87c76dded..17be9675f4 100644
> --- a/xen/common/lzo.c
> +++ b/xen/common/lzo.c
> @@ -96,7 +96,7 @@
>  
>  #ifdef __XEN__
>  #include <xen/lib.h>
> -#include <asm/byteorder.h>
> +#include <xen/byteswap.h>
>  #include <asm/unaligned.h>
>  #else
>  #define get_unaligned_le16(_p) (*(u16 *)(_p))
> diff --git a/xen/common/unlzo.c b/xen/common/unlzo.c
> index 74056778eb..f908d2a61f 100644
> --- a/xen/common/unlzo.c
> +++ b/xen/common/unlzo.c
> @@ -33,7 +33,7 @@
>  #include <xen/lzo.h>
>  
>  #ifdef __XEN__
> -#include <asm/byteorder.h>
> +#include <xen/byteswap.h>
>  #include <asm/unaligned.h>
>  #else
>  
> diff --git a/xen/common/xz/private.h b/xen/common/xz/private.h
> index 511343fcc2..647f9699a7 100644
> --- a/xen/common/xz/private.h
> +++ b/xen/common/xz/private.h
> @@ -12,7 +12,7 @@
>  
>  #ifdef __XEN__
>  #include <xen/kernel.h>
> -#include <asm/byteorder.h>
> +#include <xen/byteswap.h>
>  #include <asm/unaligned.h>
>  #else
>  
> @@ -28,7 +28,7 @@ static inline void put_unaligned_le32(u32 val, void *p)
>  
>  #endif
>  
> -#define get_le32(p) le32_to_cpup((const uint32_t *)(p))
> +#define get_le32(p) le32_to_cpu(*(const uint32_t *)(p))
>  
>  #define false 0
>  #define true 1
> diff --git a/xen/drivers/char/ehci-dbgp.c b/xen/drivers/char/ehci-dbgp.c
> index c893d246de..8412da1b11 100644
> --- a/xen/drivers/char/ehci-dbgp.c
> +++ b/xen/drivers/char/ehci-dbgp.c
> @@ -5,13 +5,13 @@
>   * Linux; see the Linux source for authorship and copyrights.
>   */
>  
> +#include <xen/byteswap.h>
>  #include <xen/console.h>
>  #include <xen/delay.h>
>  #include <xen/errno.h>
>  #include <xen/param.h>
>  #include <xen/pci.h>
>  #include <xen/serial.h>
> -#include <asm/byteorder.h>
>  #include <asm/io.h>
>  #include <asm/fixmap.h>
>  #include <public/physdev.h>
> diff --git a/xen/include/asm-x86/msi.h b/xen/include/asm-x86/msi.h
> index e228b0f3f3..277375183c 100644
> --- a/xen/include/asm-x86/msi.h
> +++ b/xen/include/asm-x86/msi.h
> @@ -1,9 +1,9 @@
>  #ifndef __ASM_MSI_H
>  #define __ASM_MSI_H
>  
> +#include <xen/byteswap.h>
>  #include <xen/cpumask.h>
>  #include <xen/pci.h>
> -#include <asm/byteorder.h>
>  #include <asm/hvm/vmx/vmcs.h>
>  
>  /*
> diff --git a/xen/include/xen/bitmap.h b/xen/include/xen/bitmap.h
> index e9175ab54a..c44a1cb63c 100644
> --- a/xen/include/xen/bitmap.h
> +++ b/xen/include/xen/bitmap.h
> @@ -229,7 +229,7 @@ static inline int bitmap_weight(const unsigned long *src, int nbits)
>  	return __bitmap_weight(src, nbits);
>  }
>  
> -#include <asm/byteorder.h>
> +#include <xen/byteswap.h>
>  
>  #ifdef __LITTLE_ENDIAN
>  #define BITMAP_MEM_ALIGNMENT 8
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index fd6cd00b43..4921e6b142 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -10,10 +10,10 @@
>  #ifndef __XEN_DEVICE_TREE_H__
>  #define __XEN_DEVICE_TREE_H__
>  
> -#include <asm/byteorder.h>
>  #include <asm/device.h>
>  #include <public/xen.h>
>  #include <public/device_tree_defs.h>
> +#include <xen/byteswap.h>
>  #include <xen/kernel.h>
>  #include <xen/string.h>
>  #include <xen/types.h>
> diff --git a/xen/include/xen/unaligned.h b/xen/include/xen/unaligned.h
> index 0a2b16d05d..8a9ec8a0ac 100644
> --- a/xen/include/xen/unaligned.h
> +++ b/xen/include/xen/unaligned.h
> @@ -11,8 +11,8 @@
>  #define __XEN_UNALIGNED_H__
>  
>  #ifdef __XEN__
> +#include <xen/byteswap.h>
>  #include <xen/types.h>
> -#include <asm/byteorder.h>
>  #endif
>  
>  #define get_unaligned(p) (*(p))
> @@ -20,7 +20,7 @@
>  
>  static inline uint16_t get_unaligned_be16(const void *p)
>  {
> -	return be16_to_cpup(p);
> +	return be16_to_cpu(*(uint16_t*)p);

Hmm - this missed one of my pieces of internal feedback.

*(const uint16_t *)p

to get correct style and avoid casting away const.

Also, the put functions what to drop the __force and use typecasting
like this.

I can fix up on commit if there are no other concerns with the series.

~Andrew

