Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8382B416100
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 16:29:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194327.346178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTPin-0005kk-8n; Thu, 23 Sep 2021 14:29:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194327.346178; Thu, 23 Sep 2021 14:29:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTPin-0005iI-5e; Thu, 23 Sep 2021 14:29:09 +0000
Received: by outflank-mailman (input) for mailman id 194327;
 Thu, 23 Sep 2021 14:29:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qmWf=ON=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mTPim-0005iA-7P
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 14:29:08 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5700156c-078e-4655-9f36-d967359d60cc;
 Thu, 23 Sep 2021 14:29:06 +0000 (UTC)
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
X-Inumbo-ID: 5700156c-078e-4655-9f36-d967359d60cc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632407346;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=fpJmtosQkJuDZnBHK4mfaF9DrubibZc9iSd5IWVmdFk=;
  b=DOZ/wLdJauGAnszjg7ooGBr1a1iuvw6f0CBUPPlav+uubOkYVqF/VHyo
   S6xwLKaAmJnckehq3GDNmt/9mJzKcPiwIdWz7MwAMmwn/Nah1nTvc6tka
   oGx9rG+NO/CsuVNUwbOT+z8uJE/hAcg4cgwQ6RNmKHD4n8IwT8xpAPi35
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7IfbeGX0JCuLGRorB6pmow2vVVhXJ/8YS/eRR3uTqL1xpK4VED2/Sf2fGlTMsJ0VBzZGKbjxMf
 IRcKDM+mjaAYG5QVIy5ps51mF8p6Km9bpZiuqhTxyQzOxLrMYZL46VjpsRXRJo/Ct+N5yiGgb9
 AB1pkg+utO8S1zm6twZDS5UM4QpSI7ExTSNltYKPvoxduIvdRwmWZHZr5X/MuxfSeOdMy3NeKu
 hdMt12abBVd+I7TYUli6iyqa7EIfLn7k3n+uzmDxQ4RvrU0WZGePYtnpnO+pNREGEqXPELoW4O
 9sdUTY3phovAz9RHYZO+6DZo
X-SBRS: 5.1
X-MesageID: 53466486
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:kmtP4KvHueiG7jJgAKzZXRBDGufnVIhZMUV32f8akzHdYApBsoF/q
 tZmKTuGa/uNZGanc4h+a4+y8hsEsZ/UzNRqHVM/rihjHihA+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHpJZS5LwbZj29Y524PhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpltJbuZSF5LIn32/lEUzdzNWYuDKF/weqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY25sSQ6iCN
 5RxhTxHVDnMSA1qFFcrOa0bjN32lCPUKyFggQfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krW8mK8DhwEOdi3zTue7mnqluLJhTn8Wo8ZCPu/7PECqF+Zy3EXCRYWfUCmuvT/gUm7M++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDYdUYR8Nb0ozDrO1/PUzS2/QTg1Qgd4PYlOWNANeRQm0
 VqAntXMDDNpsaGIRX/1yop4vQ9eKgBOcjRfP3FsoR8tpoC5+dBu0kunosNLTfbt5uAZDw0c1
 NxjQMIWvLwVkcdD/KGy51mvb9mE98WRE1ZdCuk6WAuYAuJFiGyNO9fABbvzt68owGOlor+p5
 iNsdy+2trxmMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8lfhwyap5fJ2W4M
 Sc/XD+9ArcJZxNGioctP+qM5zkCl/C8RbwJqNiOBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzK66R4YIhIf0/llKeHr5FuZdyn3xW7T6DFPjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WkOXSIrd5PcwpaRZX5bLivw/Fqmie4ClMOMEkqCuPLwKNnfIpgnq9PkfzP8
 G37UUhdoGcTT1WdQelTQnw8Or7pQ7hlqnc3YX4lMVqygiBxaoez9qYPMZAweOB/puBkyPd1S
 dgDetmBXasTGmiWpWxFYMmvtpFmeTSqmRmKY3ivbg8gcsMyXAfO4NLlIFfirXFcEiqtuMIii
 LS8zQeHE4EbTgFvAZ+OOvKixl+8p1YHn+d2UxeaK9VfYhy0ooNrNzbwnrk8JMRVcUfPwT6T1
 gC3BxYEpLaS/99poYeR3a3d9tWnCepzGEZeDlL317fuOHmI5HenzK9BTP2MIWLXWlTr9fjwf
 u5S1fz9bqEKxQ4Yr4pmHr935qsi/N+z9aRCxwFpEXiXPVSmDrRsfiuP0cVV7/Afw7ZYvU29W
 16V+8kcMrKMYZu3HFkULQsjT+KCyfBLxWWCsaVreB33tH1t4b6KcUROJB3d2iVSIYx8PJ4h3
 ep86tUd7Bayi0ZyP9uL5syOG79g8pDUv30bi6wn
IronPort-HdrOrdr: A9a23:zzjD8al8takgczKmEU6GrXKrRYHpDfLW3DAbv31ZSRFFG/Fw9/
 rCoB3U73/JYVcqKRUdcLW7UpVoLkmyyXcY2+cs1NSZLWzbUQmTXeJfBOLZqlWNJ8SXzIVgPM
 xbAspD4bPLbGSTjazBkXSF+9RL+qj6zEh/792usEuETmtRGt9dBx8SMHf9LqXvLjM2fqbQEv
 Cnl6x6jgvlQ1s7ROKhCEIIWuDSzue77q4PMXY9dmcaABDlt0LR1ILH
X-IronPort-AV: E=Sophos;i="5.85,316,1624334400"; 
   d="scan'208";a="53466486"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YI1K0F2T0sC6McBTlBzRg0LeiT993zlVtn0sC/nQgqFL0SBRAzqt+8o8cBZ8hb80I7N2VK+Wujr8uFnrokE643l75+nd5QLvtJK8Q2M4+qD/499XhlQqxZ4jHMT3G0dT1DYRBdd8zIlrGSfXVUUfqNCJKBh7OcB3YBA1oeJGQG7Ap9YG9VZ4efOQwW9vHDK2TFXg/mMziBTUn1oJddXqI+6opqtYJ792Pqk2Q/T9DP/jfVclNPxzNibqK/TKHtXWYenlyk0PROtuuDukuNPrQ729m3scoEjSVpFMuXQBBEJl86ffDaQiGtlKx2j1AShVDq3qVWcy+tTGDnMdyoKOKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=3GGkmR/LRh2cfPblNWsv8n5RSfXbfLzVOUnqQuL1NSI=;
 b=Q/hf/3JryyKFPNahtJhoUtsdWGDQ8/RWp8SWzRkGLbvC8QWn90NXSp6zAaQuf0ZvMoPJ1WVdm1K+2nTnOFEY16ehCpjVqy1Q+bn6NrVCO82K0+pZf979PHlJC1xGo71PIW/PIlTZOmxEVmEfa6ZbPkxQbvg0nbFWp1JOdn6QTKAIPIsNCvfLScTDQSJbj9WXeXmwCieEc9YF1uX8EqbaMx7UYVc+ZdlotWt8IQDAbD00hGx//8dukS10lKvq9z7f3SIBXv10SmtMiudJs8uXR7xrIsNv9+pgxCerQq8lRI+gqRJiHDqC6EwKOlg15OesDlRqdWZKEhpxqYbZ7kB1dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3GGkmR/LRh2cfPblNWsv8n5RSfXbfLzVOUnqQuL1NSI=;
 b=Hy2rYIIdt2tmML9MRMLxsunIPDuywkVbQZcNe8y66wErgMv4/5hY8lvvXgu91qMfJ003zyzQzBzNboknRAtWWhNat/NymggCuFSh4M/9j+DfU8U3iGt4mg0eVBEvAcQJm8DjD4ii1ROE0V65JL6CY0ewLmhI1YN/SrlmYQEKRf4=
Date: Thu, 23 Sep 2021 16:28:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 6/9] x86/HVM: convert hvm_virtual_to_linear_addr() to
 be remote-capable
Message-ID: <YUyPKjWdYzCsrBQc@MacBook-Air-de-Roger.local>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
 <3397b5ea-bc21-5a2c-ba5d-afc974a92df4@suse.com>
 <YUw2RLtI73QNjaPE@MacBook-Air-de-Roger.local>
 <46f90ac6-a4f0-d00a-2956-a0e4b351f698@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46f90ac6-a4f0-d00a-2956-a0e4b351f698@suse.com>
X-ClientProxiedBy: LO4P123CA0138.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d6ac4d9-a35a-4158-16ce-08d97e9e7e14
X-MS-TrafficTypeDiagnostic: DM5PR03MB3370:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3370D494467D81A4156D338F8FA39@DM5PR03MB3370.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KglShhpYKZuX8AwLvRN6msBPGGmPMLWwaMz296dZXX9riAkt3KXkQPNFtPH/gnrmRl+AJNkk2+qUOn1lO9Ooyrq5cC3VQdB1pIdKQDF2htWiUENFTFfzZl0gZj4pv4Owo9/Oml5d4kRAoPxnTwLcNFa6J1nbJT42OhQYENjTMbsCDcjnyddc3DrrsaA/Cy+9MgvTOMgLMIcaD2tB+xir1lwjrozGDyuqPTK5wyIVVz0dt3tc8IGj1Nxvz7OGdL/bbtBPcMs3baQ0ElOI6Phw6zKJj0U7q0F0uAXpGWVJnj1HONrfbLI40p1+Ds7IsGbjy1foVY1p0mH13JRNUAtLtxMfVj9xUzE8xd8xBUzU8cm7VS5QL43cffBXcC3LzjSFNi3sGnlFO7/wtsXbLDWI3Zu3OT/kuuytTKt8zIlGzKwzYT1Nexq3v1tKPHQOhcOVzbJav/s0AQKHVsHVtIgPFHKfPDB1zdEOV8k628CA7XW6BcltvlibT/Az8b0ZQ4w5D1E3kktmVz/C1q62BFjEkyj6+L2Cqa+dtHtNnuHAIYD7L6/UULdrJiuikNE/T9LNA4th1dtJVvwmKMvL5muGuYqd0mnJqZCG9gyZwaGvpMu4Fs8/EpyFHxnK1nbYpukfQmCDEn5Ya9Y4Y7QloSeVAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(6496006)(508600001)(6916009)(6666004)(9686003)(85182001)(38100700002)(86362001)(8936002)(54906003)(956004)(66476007)(66946007)(66556008)(316002)(8676002)(26005)(186003)(6486002)(5660300002)(4326008)(53546011)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVVqUTJlMDgybUk0VDlSdUtiL1hOd202bE1UK080TWdFY1V0ZHlNa3M4TUcw?=
 =?utf-8?B?T1VPcmswQWJOaXNYMlVRWmUxVnFVZ0l6YWtScnNkUmZ1WmZUNzlkMFlnOTE3?=
 =?utf-8?B?Zi9VRzFXYldYVTdpMjVOT3lDck13Y3F0Y1NFak8wb1ovcnU0VzNKR1NjTEFT?=
 =?utf-8?B?SVBFaUo5S2Z3UndkUjZZcnVHRzdRZkxlVmRmOVRoNWNtTXc2TTVBekx1WW9E?=
 =?utf-8?B?UUlrUmg1aElxOTM4UzFPNitvRXZSaDZaQWxLSUdEZFNxdzY5SGVmelQvWkxx?=
 =?utf-8?B?OHgwa3BhNkZ2eGUvRXhxV3lyZm92aU1oZVo0ZnJhUFZ3RTN3aGcvdUpINnEr?=
 =?utf-8?B?M2EwWFd4blBkWlh4Wm93ek5RcG1KdnU4QmVSTjJXY3pjNStUbCt4TTZ6TUtF?=
 =?utf-8?B?c0JkM2RjbmNsMFpna0RscU1OMGE3ekFiTnM1SEtJM21Na3A5UmV4M2hjeUxn?=
 =?utf-8?B?MjBvWWxJNWZUaVlCZTBHdUMvOW1PamRTNllZdVN6dkZIbER2ZDNRN0tlOGY2?=
 =?utf-8?B?VHhRdG5sSkt2SEh4ZUQrZFE1TXMzY2pOZ0dBcXY2Z0NmemVtVWdwQ2NIcHJ6?=
 =?utf-8?B?a25PRVdwYVFTZjlHaW1SR1hYekgwdy9wc2l6OGlhSWFIUzhIRENZU1JML2VH?=
 =?utf-8?B?YzNRU1pBbmprYWhMQk1KWFNtUWwxV2RoVzE5dmhLNzU3aklMM01vSW0rYzBz?=
 =?utf-8?B?RWtTNlA4Z3orNkhRdjlvU29GUEw4SmJDamQ3YllyQ25haTkvYlJYeDMvYlJP?=
 =?utf-8?B?ZFMybFNPNzNibXZBcEZTKzZYZ2RRUUZwSXFrS1hFbjZ6UVBGbk02OVNLVzFS?=
 =?utf-8?B?Mmk5L0FXNlRPd3RkR2FQR3pNQU5NY00rRld1cGlCYzM5ZmtBZnBaMURRMlR5?=
 =?utf-8?B?M3I1NmdOVXlLcm90TXlQM1VLUjdxQjNtb0ZRZzZETTgxNGhtdUl0bnFtZzFh?=
 =?utf-8?B?SUZQck9zd1NNZ01FWno0Z3drKzd5czRxM0x6QW9BUU0xdHdONWFPNHRFYTY1?=
 =?utf-8?B?bjVLaVRLanh0YUJ4bFc2TkVLV0tacGt2QjBvY280TXR4N3lpR2poZ21VVXpi?=
 =?utf-8?B?K29pci9PWklMQU9Rdk5LNU1pVWRuVUxiV2tsc1BWMHRERWFWbkZVMWN4UFgz?=
 =?utf-8?B?alA3UmxtQ3p6aVZ4cWNLUWtHYW9LUTVzRHJsNk9BTzJyaWplYVFXRHFOd0Qx?=
 =?utf-8?B?RGdHcVJNdnhwRHhhbmdtODA1MjNCZUt0Uk9kV1hyQUt3VVdhcGNCbFhpU3pE?=
 =?utf-8?B?SkFqVGg3T3FSRXBIcmFVY1c3M1hOZVFVbkxJWXpYdE1rZ1BPb0FEM1BaVVpL?=
 =?utf-8?B?U2RvcmdIdG40bWdERTIzWUxWVldnR0RxQU5USmNqVjY1N3g1eU1wVHhZRitS?=
 =?utf-8?B?dzVnL0dNdlkxY2tWejVsSUpaTzJySmtUNVdGdWNrT0FZY3RnaWFUb002dldj?=
 =?utf-8?B?MUhHWnNUYmRvNitoM2FOdWg0NkkwWUY1VGc5aDhycDE4aytpL004cGRFSXVw?=
 =?utf-8?B?VW1hL3JkRVFaelEzME5GeGp3T2ZydXIrelM3dWJOY1l2U0swQjY1R2lBREFw?=
 =?utf-8?B?NzlSbDlqUlN0dHZsdTFydThvZXVjTmFFaHdVbE92cDNib3VnUFVrTlRxQ1lI?=
 =?utf-8?B?ZWtsZCtOYkhlSkgvRy80VkVGZUsrUG5ncXFKRzZDeVVkZUxMSzlBMjNBWHlD?=
 =?utf-8?B?anRTQlJVZFVaSnV1RWFTeExjV1BGdFB4Z3pxSGdNOUJIY09LWkVSQWp1clVU?=
 =?utf-8?Q?swSFqoN4dP47DwK/QwCMja71DE3m5DABDLdKfPf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d6ac4d9-a35a-4158-16ce-08d97e9e7e14
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 14:29:03.6745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7nCqYkvcOhQSBXEbt64xRrL5RFM/yuQI0rcSMWrhz4jyTelWbURHTuKn8pxLSnZIprDVtB6tCxvUhmbo7yHm/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3370
X-OriginatorOrg: citrix.com

On Thu, Sep 23, 2021 at 12:34:48PM +0200, Jan Beulich wrote:
> On 23.09.2021 10:09, Roger Pau Monné wrote:
> > On Tue, Sep 21, 2021 at 09:19:37AM +0200, Jan Beulich wrote:
> >> --- a/xen/arch/x86/hvm/hvm.c
> >> +++ b/xen/arch/x86/hvm/hvm.c
> >> @@ -2526,7 +2526,8 @@ int hvm_set_cr4(unsigned long value, boo
> >>      return X86EMUL_OKAY;
> >>  }
> >>  
> >> -bool_t hvm_virtual_to_linear_addr(
> >> +bool hvm_vcpu_virtual_to_linear(
> >> +    struct vcpu *v,
> >>      enum x86_segment seg,
> >>      const struct segment_register *reg,
> >>      unsigned long offset,
> >> @@ -2535,8 +2536,9 @@ bool_t hvm_virtual_to_linear_addr(
> >>      const struct segment_register *active_cs,
> >>      unsigned long *linear_addr)
> >>  {
> >> -    const struct vcpu *curr = current;
> >>      unsigned long addr = offset, last_byte;
> >> +    const struct cpu_user_regs *regs = v == current ? guest_cpu_user_regs()
> >> +                                                    : &v->arch.user_regs;
> >>      bool_t okay = 0;
> > 
> > Since you change the function return type to bool, you should also
> > change the type of the returned variable IMO. It's just a two line
> > change.
> 
> Can do; I would have viewed this as an unrelated change: While the
> first change needed indeed is on an adjacent line (above), the other
> one isn't.
> 
> > Also is it worth adding some check that the remote vCPU is paused? Or
> > else you might get inconsistent results by using data that's stale  by
> > the time Xen acts on it.
> 
> I did ask myself the same question. I did conclude that even if the
> remote vCPU is paused at the time of the check, it may not be anymore
> immediately after, so the information returned might be stale anyway.
> I further looked at {hvm,vmx}_get_segment_register() to see what they
> did - nothing. It is only now that I've also checked
> svm_get_segment_register(), which - interestingly - has such a check.
> I will copy the ASSERT() used there.

Thanks, with that:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Roger.

