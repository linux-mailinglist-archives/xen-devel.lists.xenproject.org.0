Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4F24F7CB0
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 12:26:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300681.512923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncPKp-0006qr-JD; Thu, 07 Apr 2022 10:25:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300681.512923; Thu, 07 Apr 2022 10:25:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncPKp-0006of-GD; Thu, 07 Apr 2022 10:25:51 +0000
Received: by outflank-mailman (input) for mailman id 300681;
 Thu, 07 Apr 2022 10:25:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9hzW=UR=citrix.com=prvs=089009d52=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ncPKo-0006oZ-9D
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 10:25:50 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 163656af-b65d-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 12:25:48 +0200 (CEST)
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
X-Inumbo-ID: 163656af-b65d-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649327148;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Qn2okBuQiWWfDw22hd6NnZw2j/XExmOdZFxMH5E+Wno=;
  b=UBI8Lk1u+1CfeMQ0GMMcyiz+G5FmEksf2DMyUfb/pm3VJvqTwcTOQ/GW
   C0S51UruxrOYv9bkORT2WAM+ZxVEjKfBnVuO/WDrX947CkEaeC/oQXsNd
   mKKncr6A7+cZ67P4mdESByojg9L+ywUVkQahRPBFsKkKMQCUZ7VhEoK9X
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: None
X-MesageID: 68245550
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1hYLm6Oibq5XdIDvrR3slsFynXyQoLVcMsEvi/4bfWQNrUpzhDNVn
 2EaCmuPP/3ZYmLyKd4iPo/j9UMO6MWHm4VqHAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl2tEw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z9
 JZom4TzcVYQLIrNheJBTRpBAT1vIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gQTayCO
 pdEMVKDajzuW0xeA0clGKlvt9fyjGjgSTNmjles8P9fD2/7iVYZPKLWGMrYfJmGSNtYmm6cp
 3na5CLpDxcCLtudxDGZtHW2iYfngifTSI8UUrqi+ZZCglee22gSAx0+TkagrL+yjUvWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnEO5Utcnc4M4O8Ux6R2Xy7qS5ACcB2MeSSVGZsBgv8gzLQHGH
 HfQwbsF2RQHXGWpdE+g
IronPort-HdrOrdr: A9a23:T7IIhauRtD9neiU2KVwCRVmA7skC2IMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJh5o6H8BEGBKUmskKKceeEqTPiftXrdyReVxeZZnMXfKlzbamHDH4tmu5
 uIHJIOceEYYWIK7voSpTPIaerIo+P3sZxA592ut0uFJDsCA8oLjmdE40SgYzZLrWF9dMEE/f
 Gnl656Tk+bCBIqh7OAdx44tob41r/2vaOjRSRDKw8s6QGIgz/twqX9CQKk0hAXVC4K6as+8E
 De+jaJppmLgrWe8FvxxmXT55NZlJ/K0d1YHvGBjcATN3HFlhuoXoJ8QLeP1QpF491HqWxa0u
 UkkS1Qe/ib2EmhOV1dZiGdnTUI5QxerkMKD2Xo2EcL7/aJHA7SQPAx+r6xOiGplXbI+usMip
 6jlljpx6a+R3n77VXAzsmNWBdwmkWup30+1eYVknxESIMbLKRctIoF4SpuYdw99Q/Bmcka+d
 NVfYnhDTdtACenRmGcunMqzM2nX3w1EBvDSk8eutaN2zwTmHxi1UMXyMEWg39FrfsGOtR5zv
 WBNr4tmKBFT8cQY644DOAdQdGvAmiIRR7XKmqdLVnuCalCMXPQrJz85qkz+YiRCdY15Yp3nI
 6EXEJTtGY0dU6rAcqS3IdT+hSIW2m5VSSF8LAp23G4gMyKeFPGC1zwdLl1qbrSnxw2OLyvZ8
 qO
X-IronPort-AV: E=Sophos;i="5.90,241,1643691600"; 
   d="scan'208";a="68245550"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+w3CrtuCTMIIFmdi3kvEdPx1Fif81sWKl1Yu32LYj338GTkfsz2daV6/uIoa6F81iE9hNMnYRbx3jR0U916MgKQsJW0R+tJsa1S3baQ8Pw2UcM5LVdLh9Hsihrc0GpsOc1l2A3E7MktHOwVfq/djqQX3XriltqJ43qFGfyPBFqco5Ycfe1Ml5L5S9MjjVIDrFhSfvADfMvHKvMCILjmwAQArWxWlvzrjz/YykcOXpb1E+omqzG5avgBEOA+yqq2PSn7cHJlT2EgJNOU8FJQU4GqPXQgUkgirXbNyGfeokYR2iCVO12TUqDAFXjxASoUNa4fHdUXQbVYGGhOTjYblg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qn2okBuQiWWfDw22hd6NnZw2j/XExmOdZFxMH5E+Wno=;
 b=l6y9bFYmf9WUXaKlG72HURUm8/EiUynlI0xPGFPgHZ99uyU+U4cGQpdBbRly/F3ZhlfvCAw1o/OeDF5QZb94QKJfsHEGRoC6/7A5dLrtgDcXROUaOsz0nfj3xjUdIebA/QO0+0HaLEXiU9VkisBFhjV6scwCibW7gaqv+HtzvUr3QN0KN7Ni2LjBSd9NqUL5EIIPDPpXnkU/VVVYSeyiwi7b14LCiv133CtuenHiw8JKFFGaun8UY8tLTc9JFuX/V1CYUl4Jzt4kbP71Syd/1npwSlJ69JbqfofHRHHdIorJeYZrZDACZbHSj7RfpLEQMyMsskUOG7siySFYDuyB3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qn2okBuQiWWfDw22hd6NnZw2j/XExmOdZFxMH5E+Wno=;
 b=X+lmZfCLs0RjXVF7AioDVy2wr51tFPGOlKq6BBqGd3tUzR7TH5x++382D3yHc0FSxlHc7ae31G+Oi9AY/qkTY+qR1uuK9vfsRER9xuEWWxIvswOPWmBSiVHidqMiyacUS7MIgNQAKbuwv9ilNq5AcgRmOk2TS9p5EXFW7Y7IXWc=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/cpuid: Clobber CPUID leaves 0x800000{1d..20}
Thread-Topic: [PATCH] x86/cpuid: Clobber CPUID leaves 0x800000{1d..20}
Thread-Index: AQHYShse3pTPowzhzUqzya5673Xmyazj/KiAgABCvgA=
Date: Thu, 7 Apr 2022 10:25:30 +0000
Message-ID: <caef7cae-c771-cb30-c24a-f802e5fda047@citrix.com>
References: <20220407010121.11301-1-andrew.cooper3@citrix.com>
 <008be273-8730-5637-f35c-021e67d3d664@suse.com>
In-Reply-To: <008be273-8730-5637-f35c-021e67d3d664@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1558c95c-b351-4884-2966-08da1880f13f
x-ms-traffictypediagnostic: DM6PR03MB3850:EE_
x-microsoft-antispam-prvs: <DM6PR03MB3850C62131E64C2859F20FD2BAE69@DM6PR03MB3850.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FJ1Es4SL8yS1o1H9CSbVJ8U8kC9wTYTjhH4l1mvHZIOrDBYTLrPZBX/Cj4bezzk3hESuNMmd4eonl73GraW7FLi7HmfJ2kCeApNiuLqIYPp26qK7s1qoFoQgn1LK4snseqXTKD9mfhxEmOPzxVwVSbI5fKVIcJc8cEAryBDB+LKiAcA4uOiqCEVNw6lge2ECDXk8YAVzGZAzXs+cw4Av2WixOifQ2SiBhgWtgkyoeFURm2wirMQIksXNJ2xlQD7kd9WO3atp9nPTr2VgzBxWT5vydC4R6d3oMZicve/IdzRjVjg5cYXTBkMqgVWnmlowC0SquVQW57HZudDzbp/vPT9STlR4VvyDsIcaisXk4CuAdZeAxWbRa3QMeOvvgoBSu6nummG84qeEqKrgrpJZ6PmdKZ1YZ7sqZZE4O+ozQ1JaYDl2A3ZpCsTjfqXnKLxKNZF1tBt89HxrYBfqWorgCWjdr0sd9CQB3SN1LFRUJ3zLSNyWq+p0r7RZQscCogaUeM9wIbJdpeDwllzlM/Tko3aYWJf18NQ1fIWBCSdomQ8idsiS3buV1OJpuuGbi6ce3HKaYoGGwbmhTkoSFbpjVbA2sV+lMtrraVlvPuMst9ZkjbDULWWSCQ/VJSgUyd7OZN82Tvhka9NwZtohcDWbeMHESraMrw+WKEKEUSyHamDlARynQiKdpQlqjPMKgBL2Wu2SSTlhrPR/3DOcGrH4jwI2vbVs7jASvBG7s/HmVnSxLDeWSNdOumXD963wgTi1p9N3NSpM+JPjZwZTyu3OrQ0c1/9MjPxzYtAZmGN0nIFTj0olZNLrVszUNIvTZyxFs24ia628tL6oR3PNdZ0as+Z2TIxTw67qWvI3wxWbc6ES/FyZggPcftmLW891wWAM
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66574015)(66476007)(64756008)(508600001)(54906003)(66446008)(966005)(6916009)(26005)(38070700005)(2616005)(76116006)(4326008)(8676002)(6486002)(91956017)(316002)(186003)(36756003)(66946007)(71200400001)(66556008)(31686004)(31696002)(6512007)(6506007)(86362001)(53546011)(38100700002)(122000001)(83380400001)(2906002)(8936002)(5660300002)(82960400001)(101420200003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVM1ME93QWpYbFBYaXY5T1laVFNpU2NHdnc1bDJNYk1nSm5XTll0dXAxZ0Z3?=
 =?utf-8?B?RTlWRk9va0tQOUVYMU1XN1MwWjNxL3Y5Y2ZhSCs3M1M2QUhMeFBuY2xjUkdz?=
 =?utf-8?B?Q1JHZFRzM0dXTy9HK1A4Smp6aGVCL2xkcHNlS1lmV2RFL2g5UHBDZ013cGNt?=
 =?utf-8?B?aE82U3ZOSDViMlZiV0hYN3JiejA3Z1o0YUlCS3QwUEhYdzF4VW9Valg4TWxj?=
 =?utf-8?B?a21hWGNCWU1nNk8xd0wzZE9yQWZ0QWcvUDROY1NZSVpSWHFhZzVTMEJBS0Nh?=
 =?utf-8?B?MlhWcXFiUGpHd3hzbUEzaHgyeUtNbG1jRFE3VFlaVllPZmROZHh4Q2FDM3ZJ?=
 =?utf-8?B?YkJsbGQyWUtMRTBPZ1FHeWZSZlp1eHNWcVYrbVcvazVjYXhSMFRZZUsrbW5z?=
 =?utf-8?B?OVFtb2NBckcrNXNFRk4xaUdvcHE2aHlFWXo2ais0bXlmNHM5dC9HZStLR25G?=
 =?utf-8?B?SjNYYU1aWjZWNVVNYS8zUVY1WTllVlJRZ1pnK3RNaUc1TU1SYkw3U05DdUxw?=
 =?utf-8?B?NlA0MEhWaWlVQlJHbDZhbUNvQm1GUjIvN2NreCtLSWdlTXNYeWM3a0Q3WU1W?=
 =?utf-8?B?dFlmTGVadmM4VkNKbnQyQk5EcmMyY1pKUnNTdVNHNUt6U1pncHczNGFGODRH?=
 =?utf-8?B?N250TmpheSttSFBweVVyS3JNblduYzFETGtPMmNaY0l4WGxZWjZwV2VOaGRm?=
 =?utf-8?B?UUFNWXhNc0R4eTI5YWsyTm9Ec0gzdGhSR1hIOHU0a3ozQkpPSzhkU05adkly?=
 =?utf-8?B?SzdqY0VsTGl0ZGpnYnZkZDZ0NmY4ZmFHazNLbFBkUEdza2VPWE45ZDgxaHFp?=
 =?utf-8?B?VFJ2OGROS21YaUUzOUZBVGN4cnpuRlBnTlRqSUVTZVgySnpmU0ZMTUFQWmY2?=
 =?utf-8?B?dTFWM0hJYlBEelBTRWVoaGlMUVhvTmx2anFUSXBJU3dNT085WDV6TlVxa01v?=
 =?utf-8?B?OFNSSUVuZjFhY1RkWjAwenY3QVVpOXNBYk5MWjBuYjlUK29QRVF3UjFYc0Vz?=
 =?utf-8?B?bHZXMElyV09wa0lDYXNjSFpRckpuWUNWYUZoNERHL1NweVBndUhJa2JLNVR2?=
 =?utf-8?B?U3BkampZWTRHOVZMWGxnWFBNSHAwNGpjdkVURUdQdVBsSUZpdXNsQ1BlZENR?=
 =?utf-8?B?YUxHSFlQWFBjY1FXNDdvZVlTRFBUZTZBajNES1ZyNnZZV0o0ODI1VWIzUVBO?=
 =?utf-8?B?K0lISngyTEhSM01yUGFlTXNUVzgwMEtvSDFMcVl5UHNtanNudFM2VWNkR25D?=
 =?utf-8?B?cmVPckNsZmZsWE51MHVyL0dwV1owS295ZWZ4d2U5WGpMaFk1Y1l1c3Jhbldv?=
 =?utf-8?B?WWtqVlVKTExkRlc4REpTcUJDY2ZFNkt0U1dRbzdSaEdjOGdGOXB5MzQyV3NP?=
 =?utf-8?B?RE1HeWtFbVVGQWlEZWNoSitFc25CbXFNMUZuMFdkUGpwMzlqcTJBaEJVYUh1?=
 =?utf-8?B?a2Z1QzdPRnlZeDhaYnRKNWdXdXdTNjFjam05elRBUGZ5amFhR29LS25La3ND?=
 =?utf-8?B?T0pZZUlSaTcrSWV1MCtTQmEvY1k0dTN1TzRyamNEcUd5ekpsVDdtdFpFNGlX?=
 =?utf-8?B?SlVUbHowejczbWpSVHlSMzczQ05DckEzTzViTExUMEo3b0IzN3E5MUl1bGpE?=
 =?utf-8?B?ZWtPcGxMMzVhN3A4TW4xalk1LzZlNC9FQjJwVHVoSFRpelVPaWViSldXWWcw?=
 =?utf-8?B?dVF4RkpDdERkbUdBNXZXN2dEWFBLMkJmK3B4RHFtbVYrQTNVWDIvbzNpMWVQ?=
 =?utf-8?B?WjJtb2F0eWJGTVI2QVp5eXZqRWlHVzZpNGNkSlNmenNBZllMMDI4ZzNldjVu?=
 =?utf-8?B?RlZlMFM5RmpKL0pqcFFLQ0lqYU9jMnhYUzhRWjNrL1JXdng3eXlKRFNnYVBG?=
 =?utf-8?B?aVJVNTBMT2ttZGg3SndSaHBLN25UNlNZZHlEbHZhUFl0L2o1ZHN3RFRoMi91?=
 =?utf-8?B?OGZsd3VUQWdKUVF3MGl2ZGM5NlhQYWo4R0JCaFpGdDdaaEFSNmpnd2IzWVhV?=
 =?utf-8?B?K21Kd0pCZitYRTFHZ3ZQblFvUXMwL2FQVlJSYU9tNlo0NUluZk9uS04zZ0tO?=
 =?utf-8?B?WmUrdnR0Y1hzU0R5V3ZORTRTS2FLL04wR05PSGdNdEZkNFJQZlltdi9tNk15?=
 =?utf-8?B?cW1penhJdGY4dUdaMVE5VWhKWkxLVGtESVZlNkVaTG5GbUQ4am5YeStrdEJT?=
 =?utf-8?B?MGdCTExJQlUyNURydUhVMEI5NC9KRFhXRTNGTWExdzV3K2JhRURyZ1pPUXJX?=
 =?utf-8?B?TXJPR0FndCt6R1dXRWlKVXpUbnZCT3F5UTBMcnhheXduNFp5NVVMQ0ltMjBt?=
 =?utf-8?B?c3AvdXhkLzBsNmtqVWtza1dRcWRaZHNYSXJ1aXl1Tlp1akFCUklmZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA722F45B0B66047871B119F3EB2A0F3@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1558c95c-b351-4884-2966-08da1880f13f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2022 10:25:30.7737
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Xd/1qTesS7tdTOO9qvEKpnJkUioOnbxPMjHLtTcU6t093wTB+0yYf2VMiv0GJqkOOjodQpydbfQvaLFWqvmuFKlk91ke0r3IjyiuwnEGvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3850
X-OriginatorOrg: citrix.com

T24gMDcvMDQvMjAyMiAwNzoyNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA3LjA0LjIwMjIg
MDM6MDEsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBjL3MgMWE5MTQyNTZkY2E1IGluY3JlYXNl
ZCB0aGUgQU1EIG1heCBsZWFmIGZyb20gMHg4MDAwMDAxYyB0byAweDgwMDAwMDIxLCBidXQNCj4+
IGRpZCBub3QgYWRqdXN0IGFueXRoaW5nIGluIHRoZSBjYWxjdWxhdGVfKl9wb2xpY3koKSBjaGFp
bi4gIEFzIGEgcmVzdWx0LCBvbg0KPj4gaGFyZHdhcmUgc3VwcG9ydGluZyB0aGVzZSBsZWF2ZXMs
IHdlIHJlYWQgdGhlIHJlYWwgaGFyZHdhcmUgdmFsdWVzIGludG8gdGhlDQo+PiByYXcgcG9saWN5
LCB0aGVuIGNvcHkgaW50byBob3N0LCBhbmQgYWxsIHRoZSB3YXkgaW50byB0aGUgUFYvSFZNIGRl
ZmF1bHQNCj4+IHBvbGljaWVzLg0KPj4NCj4+IEFsbCA0IG9mIHRoZXNlIGxlYXZlcyBoYXZlIGVu
YWJsZSBiaXRzIChmaXJzdCB0d28gYnkgVG9wb0V4dCwgbmV4dCBieSBTRVYsDQo+PiBuZXh0IGJ5
IFBRT1MpLCBzbyBhbnkgc29mdHdhcmUgZm9sbG93aW5nIHRoZSBydWxlcyBpcyBmaW5lIGFuZCB3
aWxsIGxlYXZlIHRoZW0NCj4+IGFsb25lLiAgSG93ZXZlciwgbGVhZiAweDgwMDAwMDFkIHRha2Vz
IGEgc3VibGVhZiBpbnB1dCBhbmQgYXQgbGVhc3QgdHdvDQo+PiB1c2Vyc3BhY2UgdXRpbGl0aWVz
IGhhdmUgYmVlbiBvYnNlcnZlZCB0byBsb29wIGluZGVmaW5pdGVseSB1bmRlciBYZW4gKGNsZWFy
bHkNCj4+IHdhaXRpbmcgZm9yIGVheCB0byByZXBvcnQgIm5vIG1vcmUgY2FjaGUgbGV2ZWxzIiku
DQo+Pg0KPj4gU3VjaCB1c2Vyc3BhY2UgaXMgYnVnZ3ksIGJ1dCBYZW4ncyBiZWhhdmlvdXIgaXNu
J3QgZ3JlYXQgZWl0aGVyLg0KPj4NCj4+IEluIHRoZSBzaG9ydCB0ZXJtLCBjbG9iYmVyIGFsbCBp
bmZvcm1hdGlvbiBpbiB0aGVzZSBsZWF2ZXMuICBUaGlzIGlzIGEgZ2lhbnQNCj4+IGJvZGdlLCBi
dXQgdGhlcmUgYXJlIGNvbXBsZXhpdGllcyB3aXRoIGltcGxlbWVudGluZyBhbGwgb2YgdGhlc2Ug
bGVhdmVzDQo+PiBwcm9wZXJseS4NCj4+DQo+PiBGaXhlczogMWE5MTQyNTZkY2E1ICgieDg2L2Nw
dWlkOiBzdXBwb3J0IExGRU5DRSBhbHdheXMgc2VyaWFsaXNpbmcgQ1BVSUQgYml0IikNCj4+IExp
bms6IGh0dHBzOi8vZ2l0aHViLmNvbS9RdWJlc09TL3F1YmVzLWlzc3Vlcy9pc3N1ZXMvNzM5Mg0K
Pj4gUmVwb3J0ZWQtYnk6IGZvc3NsaW51eCA8Zm9zc2xpbnV4QGF1c3NpZXMuc3BhY2U+DQo+PiBS
ZXBvcnRlZC1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2li
bGV0aGluZ3NsYWIuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4NCg0KVGhhbmtzLg0KDQo+DQo+PiBJdCB0dXJucyBvdXQgdGhhdCBJbnRlbCBs
ZWFmIDQgYW5kIEFNRCBsZWFmIDB4ODAwMDAwMWQgYXJlICphbG1vc3QqIGlkZW50aWNhbC4NCj4+
IFRoZXkgZGlmZmVyIGJ5IHRoZSAiY29tcGxleCIgYml0IGluIGVkeCwgYW5kIHRoZSAkWC1wZXIt
Y2FjaGUgZmllbGRzIGluIHRoZQ0KPj4gdG9wIG9mIGVheCAoSW50ZWwgaXMgdGhyZWFkcy1wZXIt
Y2FjaGUsIEFNRCBpcyBjb3Jlcy1wZXItY2FjaGUgYW5kIGxhY2tzIHRoZQ0KPj4gY29yZXMtcGVy
LXBhY2thZ2UgZmllbGQpLg0KPj4NCj4+IEFzIG5laXRoZXIgdmVuZG9yIGltcGxlbWVudCBlYWNo
IG90aGVycyB2ZXJzaW9uLCBJJ20gaW5jcmVkaWJseSB0ZW1wdGVkIHRvDQo+PiByZXVzZSBwLT5j
YWNoZSBmb3IgYm90aCwgcmF0aGVyIHRoYW4gZG91YmxpbmcgdGhlIHN0b3JhZ2Ugc3BhY2UuICBS
ZWFkaW5nIHRoZQ0KPj4gZGF0YSBvdXQgaXMgZWFzeSB0byBrZXkgb24gcC0+ZXh0ZC50b3BvZXh0
LiAgV3JpdGluZyB0aGUgZGF0YSBjYW4gYmUgZG9uZQ0KPj4gd2l0aG91dCBhbnkgZnVydGhlciBj
b21wbGV4aXR5IGlmIHdlIHNpbXBseSB0cnVzdCB0aGUgc2VuZGluZyBzaWRlIHRvIGhhdmUgaXRz
DQo+PiBpbmRpY2VzIHRoZSBwcm9wZXIgd2F5IGFyb3VuZC4gIFBhcnRpY3VsYXJseSwgdGhpcyBh
dm9pZHMgbmVlZGluZyB0byBlbnN1cmUNCj4+IHRoYXQgcC0+ZXh0ZC50b3BvZXh0IGlzIG91dCBv
ZiBvcmRlciBhbmQgYXQgdGhlIGhlYWQgb2YgdGhlIHN0cmVhbS4gIFRob3VnaHRzPw0KPiBTb3Vu
ZHMgcXVpdGUgcmVhc29uYWJsZSB0byBtZS4gSSBndWVzcyB0aGUgbWFpbiByaXNrIGlzIGZvciBu
ZXcgdGhpbmdzDQo+IHRvIGFwcGVhciBvbiBlaXRoZXIgdmVuZG9yJ3Mgc2lkZSBpbiBhIHdheSBi
cmVha2luZyB0aGUgb3ZlcmxheWluZw0KPiBhcHByb2FjaC4gQnV0IEkgZ3Vlc3MgdGhhdCdzIG5v
dCBhIHNpZ25pZmljYW50IHJpc2suDQoNCk5laXRoZXIgb2YgdGhlIHZlbmRvcnMgYXJlIGdvaW5n
IHRvIGNoYW5nZSBpdCBpbiBpbmNvbXBhdGlibGUgd2F5cyB0bw0KaG93IHRoZXkgY3VycmVudGx5
IGV4cG9zZSBpdCwgYW5kIGl0J3MgZGF0YSB0aGF0IFhlbiBkb2Vzbid0DQpwYXJ0aWN1bGFybHkg
Y2FyZSBhYm91dCBpdCAtIHdlIG5ldmVyIGludGVycHJldCBpdCBvbiBiZWhhbGYgb2YgdGhlIGd1
ZXN0Lg0KDQpXaGVuIHdlIGZpeCB0aGUgdG9vbHN0YWNrIHNpZGUgb2YgdGhpbmdzIHRvIGNhbGN1
bGF0ZSB0b3BvbG9neSBwcm9wZXJseSwNCnRoZSAkZm9vLXBlci1jYWNoZSBmaWVsZHMgbmVlZCBh
ZGp1c3RpbmcsIGJ1dCB0aGF0IGxvZ2ljIHdpbGwgYmUgZmluZSB0bw0Kc3dpdGNoICggdmVuZG9y
ICkgb24uwqAgU2luY2Ugd3JpdGluZyB0aGlzLCBJIGZvdW5kIEFNRCdzDQpjb3Jlcy1wZXItcGFj
a2FnZSBhbmQgaXQncyBpbiB0aGUgYWRqYWNlbnQgbGVhZiB3aXRoIGEgd2lkZXIgZmllbGQuDQoN
Cj4gQXMgdG8gb3JkZXJpbmcgZGVwZW5kZW5jaWVzOiBBcmUgdGhlcmUgYW55IGluIHJlYWxpdHk/
IE5laXRoZXIgdmVuZG9yDQo+IGltcGxlbWVudHMgdGhlIG90aGVyIHZlbmRvcidzIGxlYWYsIHNv
IHRoZXJlJ3Mgb25seSBnb2luZyB0byBiZSBvbmUgaW4NCj4gdGhlIHN0cmVhbSBhbnl3YXksIGFu
ZCB3aGljaCBvbmUgaXQgaXMgY2FuIGJlIGRpc2FtYmlndWF0ZWQgYnkgaGF2aW5nDQo+IHNlZW4g
bGVhZiAwIGFsb25lLg0KDQpUaGUgY29tcGxleGl0eSBpcyB3aGF0IChpZiBhbnl0aGluZykgd2Ug
ZG8gaW4NCng4Nl9jcHVpZF9jb3B5X2Zyb21fYnVmZmVyKCkuwqAgSSd2ZSBkb25lIHNvbWUgcHJv
dG90eXBpbmcsIGFuZCB0aGUNCmVhc2llc3Qgb3B0aW9uIGlzIHRvIGFjY2VwdCBib3RoIDQgYW5k
IGUxRGQsIGluIGEgbGF0ZXN0LXRha2VzLXByZWNlZGVudA0KbWFubmVyIHByZWNlZGVudCwgYW5k
IHRoYXQgd2UgZG9uJ3QgY3JlYXRlIGludGVybGlua2FnZSB3aXRoIHRoZSB0b3BvZXh0DQpiaXQu
DQoNCkkndmUgYWxzbyBnb3QgYSBwaWxlIG9mIGZpeGVzIHRvIHRoZSB1bml0IHRlc3RzIHNvIHdl
IGhvcGVmdWxseSBjYW4ndA0KbWFrZSBtaXN0YWtlcyBsaWtlIHRoaXMgYWdhaW4sIGFsdGhvdWdo
IHRoYXQgd2lsbCBkZXBlbmQgb24gZ2V0dGluZw0KdGVzdC1jcHVpZC1wb2xpY3kgcnVubmluZyBp
biBPU1NUZXN0IHdoaWNoIGlzIGEgdG9kbyBsaXN0IGl0ZW0gd2hpY2gNCnJlYWxseSBuZWVkcyB0
byBnZXQgZG9uZS4NCg0KfkFuZHJldw0K

