Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 627D74A4DA4
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 18:59:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263249.455899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEaw9-0007El-1p; Mon, 31 Jan 2022 17:57:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263249.455899; Mon, 31 Jan 2022 17:57:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEaw8-0007Cw-UV; Mon, 31 Jan 2022 17:57:56 +0000
Received: by outflank-mailman (input) for mailman id 263249;
 Mon, 31 Jan 2022 17:57:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ytUN=SP=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nEaw7-0007Cq-9r
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 17:57:55 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e035625-82bf-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 18:57:52 +0100 (CET)
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
X-Inumbo-ID: 4e035625-82bf-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643651872;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ifNhl5mHBqpz5WMcanaHfbY0cXjC0UyFvBYedAXiV9s=;
  b=LjucKqYamSGv/tJcCYdcoxF1yR9sxcjbzi6usTMJ0i6CnZXPrsQGUV8Z
   IWLVFGHA2Ej4VI0cwJwUvWA/zlWSACC7PtJYUyd/lIJYss7dj8Ej5A1y7
   wc1gbdrVkKvYyotmrHQ37gtLxvnrfyUko2BjFx3C9xpQON1CvkyQWMgsI
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: x/IAGrB4Sh3PCYty79aunHZDajayjJgF0LQ3ilKyZiO6zl6G+jRjha7TBQ8hyP74glr6rSayjw
 zy7CmiLJ8dbEgA+GXGCJgMLNXT7yZbPNjp/H2V4d/mH79cXd7eUCr2yY7rkQQu21+/JrqpSeXu
 lrsI1PNEwsZAFYZo7jMo6zz22cKLCz5L7yR5bWwhRfylZL9A9VV/sddjEdxjkdunrSzTG1H7HL
 Xeq8JEBtMW66arYJihrg2L4kqs1+9FEEEIhb1UlYx/TJKSOE0VUVbluyfLh3dR2EyNRwyGrIXp
 GcXdTnHyADVSFprr1cNL0sDm
X-SBRS: 5.2
X-MesageID: 63154465
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+ygtvqhSJR36eElQEbsmyg7QX161ZRYKZh0ujC45NGQN5FlHY01je
 htvDGiFb67YYWHxL9x/YNiy8BsEsJHQyYUwHFQ//ng2Hyob9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tcz2IDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1xjceoGC0pYpbtv+4FcRhWIwVsGbJZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u3ZkTQaqAO
 qL1bxJdXEyRZy1JImwcS544ssmk3V/zeBNx/Qf9Sa0fvDGIkV0ZPKLWGOTSftuGVMBEhHGyr
 2jN/3n6KhwCPdnZwj2Amlq3nfPGly7/XIMUFZW7++RsjVnVwXYcYDUcWEGnu/C/hgi7UshGN
 k0P0iM0qO4580nDZtrwQRy+5mKFtxg0WtxMHul84waIooLW/gDfAGEHRzxAbdUOtckqSDhs3
 ViM9/v2ARR/vbvTTmiSnp+EoDX3NSULIGsqYS4fURBD89TluJs0jB/EUpBkCqHdpt/6Azbr2
 BiRsTMzwb4UiKYj1bi//F3BqyKhoN7OVAFdzgfdU3+h7wh5TJW4fIHu4l/ehcusN67AEAPH5
 iJd3ZHDsqZeVvlhiRBhXs0xJOqxttyFbAb9plR3PZgvxxC/32G8KNU4DC5FGG9lNcMNeDnMa
 UDVuB9M6JI7AEZGfZObcKrqVZ10kPGI+cDNE6mNM4EQOsQZmBqvoXk2DXN8yVwBh6TFfUsXH
 Z6AOfihAn8BYUiM5GrnHrxNuVPHK81X+I8yeXwZ50n9uVZ9TCTMIVvgDLdoRrpjhE9jiF6Nm
 +uzz+PQl31ivBTWO0E7C7I7I1EQNmQcDpvrscFRfePrClM4RDp8W6CJke1wJ90Nc0FpegHgp
 CvVtqhwkwKXuJE6AV/SNiALhE3HAP6TUk7XzQRzZA31ihDPkK6k7bsFdotfQFXU3LcL8BKAd
 NFcI5/oKq0WElzvom1BBbGg8tAKXEn11GqmYnr0CBBiLsUIb1GYpbfZkv7HqXNm4tyf75Vu+
 tVNF2rzHPI+euiVJJ+IMKrxlw/g4il1dSAbdxKgH+S/sX7EqeBCAyfwkuU2M4cLLxDCzSGdz
 AGYHVETouylnmP/2IOhaXmso9j7Hu1gMFBdGmWHv7+6OTODpjiowJNaUfbOdjfYDTum9KKnb
 ORT7vf9LPxYwwoa79siS+5mnfAk+t/ih75G1QA4Tn/FWEumV+F7KX6c0MgR6qAUnu1FuRG7U
 16k88VBPenbI9vsFVMcfVJ3bumK2fwOtCPV6PA5fBfz6CNtpeLVWkROJRiczidaKeItYo8ix
 O4gvu8Q6hC+1UV2YorX0HgM+j3VfHIaUqghupULO6PRi1ImmgNYfJjRKi7q+5XTOd9CBVYnf
 22Pj63YirUCmkebKygvFWLA1PZ2jIgVvEwY10cLIlmEl4aXhvIz2xENoz07Qh4Mk0dC2uN3f
 GNqK1d0NeOF+DIx3JpPWGWlGgdgAhyF+xOulwtVxTOBF0T4BHbQKGAdOPqW+BFL+m1RSTFX4
 bWExTu3Sj3tZszwgnM/VEMNRyYPljCtGtkuQPyaIvk=
IronPort-HdrOrdr: A9a23:7YzwGavwxjxXZGKj7begffg67skDQdV00zEX/kB9WHVpm5Sj5q
 STdYcgpHjJYVcqKQodcL+7WJVoLUmwyXcx2/h1AV7AZnidhILLFvAA0WKK+VSJcEfDH6xmpM
 VdmsNFZ+EYeGIasS+M2meF+rgbrOVvu5rY49s2h00dND2CRZsQlztENg==
X-IronPort-AV: E=Sophos;i="5.88,331,1635220800"; 
   d="scan'208";a="63154465"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QpyDm3gJdZKLySKU/9IPl3lARGhLWsVSf4Oz8YSRlo19hvbusdl2C2BghHI/L5bQBmrUO5f70Zirjt0lsaLvLaAJpXUEWcdiUnbktAl/US7ece5IkPsCORW4zs6jTEE7P2G0Ldk3TDZZ1RTdkouqPldYbGrGCVic0nA63rqFMDut97SIVuF7UDMYPstgTbQ59P3S3X+usRazr8CaRjwUJq9BFvup8xeOBAgVMq15rXOPtFZycGM6AkHYVfUEdeWNGUY8y2XEvOjDPtYz6IZAnnVZ+2hJsYRk3/ooH6Nqls+nYDUXfKf4q5h5XvjMiWsqEm3vWp2lxXLMTg96vrb1vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GfQWSealG9DcaIPhKSdCfAXNlI/QHZYPFvR+Bu4jOEA=;
 b=aW58tPLw9dI0SFdMmGcMum29ut5F8JZUdHPvjBBoQdwi2MX8tKHul7TIayQuUqcH4KV588VHCqCaK2GurAhjwZcYi45YKvyN5ZXUqeUpx3suWGx44XEWpx4BKt5M5pZbrE0O0NFRE6qnV7vJ4nvNq6IZf1abp2pmEy32PPOdL2wufOnQEB5tLVoRH8fqCcYy9uuCEICXIG7oKDPeR08JW1hdv7sX5MF0d46tWUnfgxEaYtwSz+INGAGNPqo1DMz4/asWREdcY+joSEyChXCBiG72Aqn8Q5v0A5rBkJOMLgUHYtBYvEZUnFRBJSAP2cUKRh5hm4asYHRhJJh9SChnDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GfQWSealG9DcaIPhKSdCfAXNlI/QHZYPFvR+Bu4jOEA=;
 b=r+u6uXGtlriYi6bh5AW3WHuD6WGLYRccnM3jOVpltHTkylMu+drci198a5To186zwyvDjQb89yxSvLtIFxEVDm+1ufyJ+4qHOopRekfMMSQ/8VoPyxaOfnJsWur3VUtr8FLHq5E1SKNcvBSTuIy1dXNQSS7H9lObG/lsolRaJp0=
Date: Mon, 31 Jan 2022 18:57:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jane Malalane <jane.malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>
Subject: Re: [PATCH 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Message-ID: <YfgjFO8WZw+c55oe@Air-de-Roger>
References: <20220127160133.11608-1-jane.malalane@citrix.com>
 <20220127160133.11608-2-jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220127160133.11608-2-jane.malalane@citrix.com>
X-ClientProxiedBy: FR0P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3526ac3-0535-420a-01be-08d9e4e32f22
X-MS-TrafficTypeDiagnostic: BN3PR03MB2161:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <BN3PR03MB2161E74DA3BD28276A7F18068F259@BN3PR03MB2161.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VP9bT4Nt3il0CkJnimK0IT2L0j1G+Mm1PS2qnZrY+YczJtxK3DaXxdbE5zQCOoSWn0CKBIvpHag/5ftOkW4CkEdC8YXg0jVzTfKrfQyVPmzIRdINhw3tAVUkThzDHupb2F+/btMhbxB+HjFyvOm5Hr1HldCt6Z8UkYQmzTNlcihggIscB7luzXjFG9G1P3v19JHYrabPzxZcYdIEMtPq0KYSAjdkUp5+yvhOF2u107lIjOXX96y7kv45/w8ARiQyafQrTCQjPkhN8TmCcSigwmXG9jb77wFGgddY9RccD4EosOtRD4WyRmhojLxbFXsWj7bmEWJuCTvKRkmS2R3MqAmET9g+ccxEKBpwGseQANNurImemdFW2jmKlpDseYTYy9USapIKxT8xR3gO3Jdh9EvDwKvdjtyMl2bdJd8Z6GHa6+9XDPu+ZmJPGNjmjO3LzjZ4zfBJKrtU0V6Pvpz0L086GEht8BqnBIAVbeZKPyLIQyWeAIivRK/CfNTKGQFEe8FpO5LLgUo9KprJ7e2dAHEaZNvQqYqXSwm3arLEK5nx94cqSBYvuJxsOUgAuv2HVxXM64irBZx1451NGKL5WtVkEbDOkHkrN2camPtXINbrP8m9PFFWx1Q3kclnH0ONeIMcoA4RbfKceDAU+PI2vWu66qFKBflnovNRQzy0uRmfSgH8djOMkUkFd16SuaLNcB8+3vmQh7EGEScJaY2P+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6862004)(4326008)(8936002)(83380400001)(26005)(8676002)(6636002)(508600001)(6486002)(54906003)(86362001)(85182001)(33716001)(186003)(66556008)(66476007)(66946007)(82960400001)(5660300002)(38100700002)(6506007)(6512007)(6666004)(9686003)(316002)(2906002)(7416002)(67856001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlRiREdXUytqbGZIMjFrWVVQcXY1K3NsYXVybWorWDQ3czBlNXRQY3BsOE8r?=
 =?utf-8?B?Vjh2NVl0WW9kWGQzb0ZMemVuNjV0QmN0K1N6VmZFb3JWVWNlVEpuMDV2VTRt?=
 =?utf-8?B?alFIdThHTGxISUhQV0lFekh3R2w3cSt2eWhDT1AvRHVmanVwcHlub3Z0cTRE?=
 =?utf-8?B?cGozbmxUOVArT2Z4clRBZzFETG9Jdm4vL1h3Y2F2VUFtOXBBVG5vZ0JJMzJY?=
 =?utf-8?B?ZVBkQ09laThQRFRsU2M2cFJxZ25pWXUzRXdjSzkrVUp3YjBNOThZTS9nNjVk?=
 =?utf-8?B?UHdoUityLzUreU10SGJwSFIwV004OTVaK0lDcDdGUklqOWtRZUZFVHZvQkhE?=
 =?utf-8?B?dUNPeGlrL3ZHcEcyeWl1Tm9HdXFRcXFpY0J0aTVjcG5qNzg3dTdNYlk0T0ZB?=
 =?utf-8?B?RGMvWTc5Q2liRC8ybnZQVUltdzFFbDZacDd0Q1JYcGtiRittVzYwWXhHSTl3?=
 =?utf-8?B?NzlTQ0xRWkl3UGpHdlpDYm9wUUp5aXl0QXZnOW5jQXUyOWJmempIejNieHMy?=
 =?utf-8?B?QittZHRvNkdKQ3grTzI2RzE3YzZ1NVIzZ1Z1Y3ZkL1Y1cmFPSGgwQVhlN01t?=
 =?utf-8?B?YlRraWxDMStyNFpSZkpuZFNiZGNnMmxoczBDcGJlaGhpdk1XK0syV2o0aFh4?=
 =?utf-8?B?d0laSnk2dkltNUZnQ1VkYkllNVAyZCtnam9TL2pveE5FRzVOWVZ1amlOWStL?=
 =?utf-8?B?cFB4djBBYXBSeldGZWFRWUExTmp3SkttRU1sRlJaZzBoamcyaEw5UnVUdWkr?=
 =?utf-8?B?TnkzczNFVnRuTFh6VkptM3VYUVJBeVR3M09wdXhyUFY1ZzRqenBOR0R0TmRI?=
 =?utf-8?B?S29xVk1kejVkOFd5SGFFbUhYMjVtOGJQdDJWRi81ek5BWmFFd0ZEeTcxT1dy?=
 =?utf-8?B?dFVpWCtRTjkvd2ErcFRhUkYvcXc2cDBKd3h3ckpOR1RBaWplZWxEbUM4ZzIx?=
 =?utf-8?B?eFhCM1JLQ25lV3Z0LzloNEpvN1lhTkFSWExLWm5FNzF6NzZCV28rZk5CSnlr?=
 =?utf-8?B?OUU2MEVQeUJReTdUc0ZZUmtpUG9ZbUFDei9Qbm1scjVuZ2hjUjAvRU0rMXdu?=
 =?utf-8?B?N1B0MFV0cmFGZytMUDI1a25aQnczcmg5N1paMm85Vm1PTThIYU1BV2ZkcEtj?=
 =?utf-8?B?ZEZKakN2K0N0M3pqM3g2NERuanJwcURDRENkbTVoYUU4NzRZK0Y1S3A0SFU0?=
 =?utf-8?B?ZENUQkNtc0hnZktGT0lYRzhLQ3ljWFZjK2JwZGhObFQ1QldTbndDek0zVG10?=
 =?utf-8?B?VGNsenhPRDdCNUVKL09uTTNFcFRqK1dsR0ZyWFhCYVdhNm12OUFxZVFVcEdn?=
 =?utf-8?B?NFh3RW1waUF1OEUweXFZek9ZWkhDaWxKaStCUmhhK3RCMXAwaGJad0FZZzRU?=
 =?utf-8?B?WnZvc2hQVlFuejhJd3M3NXVvT1kxbHl4QXhXRSszSnNyQ0tFN056U3lNaktP?=
 =?utf-8?B?NW9CelA1VEhXRVdoNk9LbDRHbU9DdEM5bWNNa0dqeG95T29NMzZ3RGEwc29H?=
 =?utf-8?B?N1ZvbisrMEFKY0tpdnhiQ0lIeVYya2hwNVIwSnZHdG8zMmVrbHFrL05kS0h5?=
 =?utf-8?B?TkJyNFo5M1FPZHY2NVROaVN6SENoSTVsNmRPSTc1ZHgxM0VHbEdyNFh5d0Vz?=
 =?utf-8?B?TEFHaTRuWkZKMzJHcm13VVA4MnIyM3JRQlZuTWs1ZWRqWVJ5dElmbDlhUVFM?=
 =?utf-8?B?OW9KZ0poMkc5ei93Vy9TaW5UNE0zdXp0N1FDRTJJdzFaejZxYXhOMmV1bkQ0?=
 =?utf-8?B?Y29uUmc0ekVrQTRObG0zVjVWaGd0VVVuamF2SVNOREtSZFlZbnd5TzNaNXRk?=
 =?utf-8?B?dzFqSGNTNCtlL0orMnlvWXM4UFRxaG9OVkRWT1hDWG5pZEo0eFlVU1VmRW52?=
 =?utf-8?B?VUZRaFVFN21zTmczbTVudUxHd0dsWFRtc3ZsOHlqQS9IT1hlWHFxQ2x1QnJs?=
 =?utf-8?B?RmtVd0p1Z0w1WUlFUWdXLzNUTmRob0lCUEhITDRJcjJkQ2IwKzMvbkRiYk0w?=
 =?utf-8?B?bU9UQXoxWFlJQjZmU3FmaHFEVzJibUNMcGpLbmViemZ4cnFJNjlQL3V4ZEtH?=
 =?utf-8?B?dWV6VzE4bzlSbUl0b2U2dHJsSWxhNGhiMy9BUFNJMFlSWmFIMm51NVE4QzBz?=
 =?utf-8?B?N2cycklhM2JHR3IzOWd6Qy9EYlFEaDExaTFkWDVrSUVGTlJSS014WUJlOHNk?=
 =?utf-8?Q?Xfwj0TUIpn6MFnoropxjfvU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3526ac3-0535-420a-01be-08d9e4e32f22
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 17:57:45.1458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QVdS4ikktpUkNKSwpJdGlBQ6uLlFzdGVwwq3kINnGepZ5JABwuqAA1ETsv59O48dbZ8nnqrVww7z4YRn5IketA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2161
X-OriginatorOrg: citrix.com

On Thu, Jan 27, 2022 at 04:01:32PM +0000, Jane Malalane wrote:
> Add XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_xapic and
> XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_x2apic to report accelerated xapic
> and x2apic, on x86 hardware.
> No such features are currently implemented on AMD hardware.
> 
> For that purpose, also add an arch-specific "capabilities" parameter
> to struct xen_sysctl_physinfo.
> 
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Wei Liu <wl@xen.org>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Juergen Gross <jgross@suse.com>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: George Dunlap <george.dunlap@citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Jun Nakajima <jun.nakajima@intel.com>
> CC: Kevin Tian <kevin.tian@intel.com>
> CC: "Roger Pau Monné" <roger.pau@citrix.com>
> ---
>  tools/golang/xenlight/helpers.gen.go |  4 ++++
>  tools/golang/xenlight/types.gen.go   |  6 ++++++
>  tools/include/libxl.h                | 14 ++++++++++++++
>  tools/libs/light/libxl.c             |  3 +++
>  tools/libs/light/libxl_arch.h        |  4 ++++
>  tools/libs/light/libxl_arm.c         |  4 ++++
>  tools/libs/light/libxl_types.idl     |  2 ++
>  tools/libs/light/libxl_x86.c         | 11 +++++++++++
>  tools/ocaml/libs/xc/xenctrl.ml       |  5 +++++
>  tools/ocaml/libs/xc/xenctrl.mli      |  5 +++++
>  tools/xl/xl_info.c                   |  6 ++++--
>  xen/arch/x86/hvm/vmx/vmcs.c          |  6 ++++++
>  xen/arch/x86/include/asm/domain.h    |  4 ++++
>  xen/arch/x86/sysctl.c                |  7 +++++++
>  xen/include/public/arch-x86/xen.h    |  4 ++++
>  xen/include/public/sysctl.h          |  1 +
>  16 files changed, 84 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
> index b746ff1081..dd4e6c9f14 100644
> --- a/tools/golang/xenlight/helpers.gen.go
> +++ b/tools/golang/xenlight/helpers.gen.go
> @@ -3373,6 +3373,8 @@ x.CapVmtrace = bool(xc.cap_vmtrace)
>  x.CapVpmu = bool(xc.cap_vpmu)
>  x.CapGnttabV1 = bool(xc.cap_gnttab_v1)
>  x.CapGnttabV2 = bool(xc.cap_gnttab_v2)
> +x.CapAssistedXapic = bool(xc.cap_assisted_xapic)
> +x.CapAssistedX2Apic = bool(xc.cap_assisted_x2apic)
>  
>   return nil}
>  
> @@ -3407,6 +3409,8 @@ xc.cap_vmtrace = C.bool(x.CapVmtrace)
>  xc.cap_vpmu = C.bool(x.CapVpmu)
>  xc.cap_gnttab_v1 = C.bool(x.CapGnttabV1)
>  xc.cap_gnttab_v2 = C.bool(x.CapGnttabV2)
> +xc.cap_assisted_xapic = C.bool(x.CapAssistedXapic)
> +xc.cap_assisted_x2apic = C.bool(x.CapAssistedX2Apic)
>  
>   return nil
>   }
> diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
> index b1e84d5258..5f384b767c 100644
> --- a/tools/golang/xenlight/types.gen.go
> +++ b/tools/golang/xenlight/types.gen.go
> @@ -389,6 +389,10 @@ RunHotplugScripts Defbool
>  DriverDomain Defbool
>  Passthrough Passthrough
>  XendSuspendEvtchnCompat Defbool
> +ArchX86 struct {
> +AssistedXapic Defbool
> +AssistedX2Apic Defbool
> +}
>  }
>  
>  type DomainRestoreParams struct {
> @@ -1014,6 +1018,8 @@ CapVmtrace bool
>  CapVpmu bool
>  CapGnttabV1 bool
>  CapGnttabV2 bool
> +CapAssistedXApic bool
> +CapAssistedX2apic bool
>  }
>  
>  type Connectorinfo struct {
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index 2bbbd21f0b..6d51e56704 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -528,6 +528,20 @@
>  #define LIBXL_HAVE_MAX_GRANT_VERSION 1
>  
>  /*
> + * LIBXL_HAVE_PHYSINFO_ASSISTED_XAPIC indicates that libxl_physinfo has a
> + * cap_assisted_xapic field, which indicates the availability of xAPIC
> + * hardware assisted emulation.
> + */
> +#define LIBXL_HAVE_PHYSINFO_ASSISTED_XAPIC 1
> +
> +/*
> + * LIBXL_HAVE_PHYSINFO_ASSISTED_X2APIC indicates that libxl_physinfo has a
> + * cap_assisted_x2apic field, which indicates the availability of x2APIC
> + * hardware assisted emulation.
> + */
> +#define LIBXL_HAVE_PHYSINFO_ASSISTED_X2APIC 1

I think you could likely introduce a single define that covers both
features, as they are introduced in the same commit, ie:
LIBXL_HAVE_PHYSINFO_ASSISTED_APIC.

> +
> +/*
>   * libxl ABI compatibility
>   *
>   * The only guarantee which libxl makes regarding ABI compatibility
> diff --git a/tools/libs/light/libxl.c b/tools/libs/light/libxl.c
> index 667ae6409b..1588701d19 100644
> --- a/tools/libs/light/libxl.c
> +++ b/tools/libs/light/libxl.c
> @@ -15,6 +15,7 @@
>  #include "libxl_osdeps.h"
>  
>  #include "libxl_internal.h"
> +#include "libxl_arch.h"
>  
>  int libxl_ctx_alloc(libxl_ctx **pctx, int version,
>                      unsigned flags, xentoollog_logger * lg)
> @@ -410,6 +411,8 @@ int libxl_get_physinfo(libxl_ctx *ctx, libxl_physinfo *physinfo)
>      physinfo->cap_gnttab_v2 =
>          !!(xcphysinfo.capabilities & XEN_SYSCTL_PHYSCAP_gnttab_v2);
>  
> +    libxl__arch_get_physinfo(physinfo, xcphysinfo);
> +
>      GC_FREE;
>      return 0;
>  }
> diff --git a/tools/libs/light/libxl_arch.h b/tools/libs/light/libxl_arch.h
> index 1522ecb97f..00cc50394d 100644
> --- a/tools/libs/light/libxl_arch.h
> +++ b/tools/libs/light/libxl_arch.h
> @@ -86,6 +86,10 @@ int libxl__arch_extra_memory(libxl__gc *gc,
>                               uint64_t *out);
>  
>  _hidden
> +void libxl__arch_get_physinfo(libxl_physinfo *physinfo,
> +                              xc_physinfo_t xcphysinfo);
> +
> +_hidden
>  void libxl__arch_update_domain_config(libxl__gc *gc,
>                                        libxl_domain_config *dst,
>                                        const libxl_domain_config *src);
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index eef1de0939..52f2545498 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -1431,6 +1431,10 @@ int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
>      return rc;
>  }
>  
> +void libxl__arch_get_physinfo(libxl_physinfo *physinfo, xc_physinfo_t xcphysinfo)
> +{
> +}
> +
>  void libxl__arch_update_domain_config(libxl__gc *gc,
>                                        libxl_domain_config *dst,
>                                        const libxl_domain_config *src)
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index 2a42da2f7d..42ac6c357b 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -1068,6 +1068,8 @@ libxl_physinfo = Struct("physinfo", [
>      ("cap_vpmu", bool),
>      ("cap_gnttab_v1", bool),
>      ("cap_gnttab_v2", bool),
> +    ("cap_assisted_xapic", bool),
> +    ("cap_assisted_x2apic", bool),
>      ], dir=DIR_OUT)
>  
>  libxl_connectorinfo = Struct("connectorinfo", [
> diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
> index 1feadebb18..33da51fe89 100644
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> @@ -866,6 +866,17 @@ int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
>      return rc;
>  }
>  
> +void libxl__arch_get_physinfo(libxl_physinfo *physinfo,
> +                              xc_physinfo_t xcphysinfo)

If you make xcphysinfo passed by reference as Anthony suggested also
make it const.

Thanks, Roger.

