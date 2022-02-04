Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3489F4A9B8A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 15:58:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265679.459108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nG01x-0008KL-HR; Fri, 04 Feb 2022 14:57:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265679.459108; Fri, 04 Feb 2022 14:57:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nG01x-0008Ha-Cn; Fri, 04 Feb 2022 14:57:45 +0000
Received: by outflank-mailman (input) for mailman id 265679;
 Fri, 04 Feb 2022 14:57:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=46ws=ST=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nG01v-0008HA-EH
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 14:57:43 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbdf22c8-85ca-11ec-8f75-fffcc8bd4f1a;
 Fri, 04 Feb 2022 15:57:40 +0100 (CET)
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
X-Inumbo-ID: cbdf22c8-85ca-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643986660;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=+DOo0BrCDS3eLT4mT1tFH4n0pDmdsTXnEmJyURa937w=;
  b=S5hNkxA4OQrxTL2a9D2m297T+P9KpEdKxgj3YwHHpkOrPLbSKw+89FGl
   vGeznOZhBSeiwVEebclo5OCYU3jNw4TwvAUZh45Eb2Dh5X4FqXfyZc++F
   3O6voMWSIlvQdVCnybkkEhAggk5kZRZ09b3LtgkSOv2NyJUK68cx/EAsb
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: EDnuLwiW5DVUk9h5XvklC3s/jjjDU8silNoA9S5sRn1wvagGcJRO9kI/pFQ2oMBiH5l7I2Cq/j
 gkuHnJ5w02Qkkfz3mQc3gu/bgEG3r0fseAN6Rv/zW+IbeVEj/pf4eeeIKEmk4+m0K7MZKO7mtY
 CVLyrjUW2LGMYqj5z0WA88cd3axKFUfbR1KvKqzorBrK+vT4nDNjDxgNsbE6conv2jCDem04yN
 A/nv83mIiBJZQ+fiSh4iDi7Hq/zWPJICxj7XKIhP+2usFwifxWIRDj8fIno5hmE0zSmSym7pxr
 4eCGBYOa5vfhu3b27XfdLoTT
X-SBRS: 5.1
X-MesageID: 63422168
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:wItRea/nA1bfpHC5sWnfDrUDoniTJUtcMsCJ2f8bNWPcYEJGY0x3y
 WscXmmDb/bcNzGnfNl1a4y+90gG65DSz4BmG1ZopH88E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rh3tYz6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhg7
 Y5Kk4WNQjxzGZPHu9hGcUVUUHtXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGh2tq3JkQTZ4yY
 eIURB5XPCrrRCEMYFkrEaw/t7yzhFrWJmgwRFW9+vNsvjm7IBZK+KDkLd79atGMA8JPkS6wj
 3ja8mHOJwAVPd2S1xKI6nupwOTImEvTUo8ICKex8PIshVSJ33ESEzUfT179qv684mauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O/cz6ByJjLHV5QmZLmEeS3hKb9lOnPExQTsmx
 1qYheTDDDZksKCWYX+F/7LSpjS3UQAXJ2IfYS4PTSMe/sLu5oo0i3rnadJuE7W8iNHvLhj2z
 yqXtyg1h7gVjskj2r2y+BbMhDfEjprUSg844C3HU2Tj6Rl2DKaCY4Gr8lHd4ex3EJeCTlKBs
 X4HnOCT9OkLS5qKkUSlW/4RFbuk4/KENjz0glN1GZQlsTO39BaekZt4uW8kYh0za4BdJGGvM
 BS7VR5tCIF7LV7xaoluXomKUeMUxovcTva5WrOOR48bCnRuTzOv8CZrbE+W+mnilkkwjK0yU
 aumndaQ4WUyUvo+kmfvLwsJ+fpyn31lmzuPLXzu50n/idKjiGippaDp2bdkRsQw9+u6rQrc6
 L6z3OPamkwEAIUSjsQ6mLP/zGzmz1BmXfgaSOQNL4ZvxzaK/kl7UJc9Jpt6I+RYc1x9zLugw
 51EchYwJKDDrXPGMx6WTXtodaniW51yxVpiY3B3bQ31hSVyOtn0hEv6S3fRVeN8nACE5aUsJ
 8Tphu3aWqgfItg502h1gWbBQHxKK03w2FPm09uNazkjZZ9wLzElCfe/FjYDABImV3Lt3eNn+
 uXI/lqCHfIrGlQzZO6LOanH5w7g4hAgdBdaAhKgzi97Ix63ruCH6kXZ05cKHi37AU6Sm2LHh
 1vKWkpwSCuki9ZdzeQlTJus9u+BO+B/AlBbDy/c67O3PjPd5W2t3clLV+PgQNwXfDqcFHyKa
 boHwvfiHucAmVoW4YNwH6wylfA15sf1pq8cxQNhRS2ZY1OuA7JmA3+HwcgQ6fEdmu4H4VO7C
 hCV591XGbSVI8e5QlQfExUoM7aY3vYOlziMsflseBfm5DV69aasWFlJO0XekzRUKbZ4adt3w
 eootMMMxRa4jx4mboSPgixOrjzeJX0cSaQ38JodBdaz2AYsz1hDZ73aCzP3v87TO4kdbBFyL
 2bN1qTYhrlayk7TSFYJFCDAjbhHmJADmBFW11tedV6HrcXI260s1xpL/DVpEgkMlkdb0/h+M
 3RAPlFuIfnc5C9hgcVOUjz+GwxFAxHFqEX9x0FQyT/cRkisEGfMMHc8KaCG+0VAqzBQeT1S/
 be5zmf5UGm1IJGtj3VqAUM1+eb+SdFR9xHZnJH1FsuIKJA2fD75j/L8fmEPsRbmXZs8iUCvS
 TOGJwqshXkX7RItnpA=
IronPort-HdrOrdr: A9a23:RfOdr64noJhPUAsVTgPXwVCBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwX5VoZUmsj6KdhrNhQItKPTOWw1dASbsN0WKM+UyDJ8STzJ856U
 4kSdkDNDSSNykKsS+Z2njALz9I+rDum8rJ9ITjJjVWPHlXgslbnnlE422gYytLrWd9dP4E/M
 323Ls5m9PsQwVdUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZuzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDk1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo90fLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWy2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 ggMCjl3ocXTbqmVQGbgoE2q+bcHEjbXy32DnTqg/blkgS/xxtCvg4lLM92pAZ2yHtycegB2w
 3+CNUaqFh5dL5jUUtMPpZwfSKJMB2+ffvtChPaHb21LtBOB5ryw6SHlYndotvaP6A18A==
X-IronPort-AV: E=Sophos;i="5.88,343,1635220800"; 
   d="scan'208";a="63422168"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPIOcOHjuRivSVkz08QDb9/1K+TR2LUtdGMo75jKZURJmWcnFXG34kbJFAcRt/IqX+AjotEphqA4EUqmFxgGab/Wx850SpKb0KesHBXQFfVm93vIn92dF+Atu8+39QQNGBPc3lVYxwVMYGy/LGRwj/Z/EEIinWYxaJbZ7F5gYV7XPdn4ZBY0juw0XDbtBqgTMHsdz/F8BEW+9rMeKqSkYQ58HfHHBYsbxeW40Q7frwmcdO2PX9bcIaqCQN9No+UeMtruHN94LOKpNIZ8Fd9t+5ncCh/q8SlUgQOV57RXd1mN7STVDj40IV1p8ZJPNr63m0IDidx2uzujhz0qV3YcrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZG4uaaIYy3T7UgrANn68Yooksm3d6t0ul6ieOOGGNc=;
 b=Izyx4PXz/VOUXrCyTakWuMsArIroqtrGshgvpBWRVXJmCKatuyS2ejAC52jzwqqHNJjaLjVFuwAyvGwHxzwRISJfWQyZSdmLPj/mMNXAgWTIeh4OTzJrwKTM9tfdjY1e3+XrYUbyfyCvwNdXviQFI0eugi5+yjcG8o/EF2HmlZXQYaGZhPemxkX+1c5Pjt5RvUlvkY6IxxxMvJJgBnIFVIAq5RbRtORnrHriuzL9v5RJM0paix33lSTNgzmt/dBXyJMUU7+4ifaMAiqcxjeMYuugj/W6dw2ttec5xqnjsCd+exbp7BUOKUpIeenZs+UDsfzBHRnpEr0vaD2KEpqCZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZG4uaaIYy3T7UgrANn68Yooksm3d6t0ul6ieOOGGNc=;
 b=O4WLxPnVzmNUzwhKIxzgSL0qgSv4YelCpDLhlwLMJYcgkkKoQWmhKWU9XzSjIpc3kGSJFItJ3UX9bmG1CPPqvTH2wRJcZ26OEk+Hq+5TSfXqBaEk+2/K2g4yh/O9Ig1FYy7n5jpAmP5T7o6UQZntzRn9q13U330cQ9sx9+v/Tkk=
Date: Fri, 4 Feb 2022 15:57:32 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Jan Beulich <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "paul@xen.org"
	<paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Message-ID: <Yf0+3C9nF8+tewLw@Air-de-Roger>
References: <04726915-f39f-9019-436e-4399533c9fc3@suse.com>
 <9ed3f4ac-0a2d-ed45-9872-7c3f356a469e@epam.com>
 <c3a99712-cf7c-37da-aac1-f2ee00e6d53b@suse.com>
 <Yf0KcVD8W05A4fbB@Air-de-Roger>
 <1ed0e342-16cd-2f16-c05c-186667a22762@suse.com>
 <7e3562b5-fc67-f213-e872-f211450d9e2e@epam.com>
 <a8fc599c-f620-c4d1-2077-c57068f46a7f@suse.com>
 <deef8468-d607-e49e-f456-6a8013329ca1@epam.com>
 <Yf0k6aoKK5G3iad1@Air-de-Roger>
 <3ad10a99-c706-b95f-1419-2c0c7cf37d58@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ad10a99-c706-b95f-1419-2c0c7cf37d58@epam.com>
X-ClientProxiedBy: LO4P123CA0232.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34e13597-1bd2-4ac2-5f0c-08d9e7eeade7
X-MS-TrafficTypeDiagnostic: SN6PR03MB4494:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB4494B9B64E22EC2B031FBC568F299@SN6PR03MB4494.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S4ZvULrE/RT6a63WhgATqJGxHKcMIj+lj8ZAIKsxGmJLJZN7Kc9yhr+geuSTRlHL9UNd//DEPgKnKdRar098RhIc6d5b8xlh8OPCkhHlGUMAm+AH5IEVso7t599z9RhaksfLrAk06KLwCyxhVGGd/ogHs3P4StfDiK8NZUDamQJtbStkh9M8j9CPZByyDwuHkwXAOOFNhOvprA2Kno0R2j5ll6AKFb4Yjpk8dv4RfHD79+D63UtnTO3e5Ucx7SsOTyJhgwJkSRgTIIkE5ut8yrdqpl0WTY75YVwTDgXrM5IKsMA6WDGdYRNtYa5umchTPTdbeNlo/ht//2Mr3aOHxEjHUSEJdA1FGXGVqtRO4lKNQdR/1+RaRl1nEs2ST+bnMkK04p3mqhPRq/SWJIAqcauatXETgh8vUOFYtkmJO8EwA1fN2VaHTq9/UZY9dOzu6/NOAw4TRnoEUzD7fxt631/vgTcACZYeiI+dzm5GG27LQOv4q6tLiGpY6jtvKTTnLWc6vRNel2FQ2N9ulGeHBUZrGpLtDH31HUsscNDZLZRhSynhr3P8Zyoop/DoEr4sg0ANkWgoBxuOzuRLFpfJljcGVy/NU9kNfkEgyJP291DDnAPB9wob9Ewq0VzsqbhoMz9NuX3WjXGQJ381L4a5IQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(53546011)(66556008)(33716001)(66946007)(66476007)(9686003)(4326008)(8936002)(6506007)(38100700002)(6512007)(8676002)(186003)(26005)(83380400001)(6666004)(2906002)(82960400001)(5660300002)(7416002)(316002)(6916009)(85182001)(86362001)(508600001)(54906003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDVRVDVheUdUaWVnNTVqQVhHSndtR0FRaW1WOTJGMVV0TUc2dVJFUy9VTVlK?=
 =?utf-8?B?SHluK3MyWHUxM2t5eFZpdHJodUlhSUo3MXBTRkgzOFBuTENQR0pNMG1lUjJq?=
 =?utf-8?B?N2d2MHhldUlvZWhUdkpGalBQM0I1dlhrbXlOdDdFUm1rM09VN1F6L0tESTdl?=
 =?utf-8?B?aUNDMVMxU0hCZ2Z6alFsNlJlV1pGNkhyZkhyOEYrOWorTHpEYVFLdW9GNzNG?=
 =?utf-8?B?Sm9aZjZFckJsUXNKRWtQSks0dUh4Q3l0bmQ4R09TQUJSbEpiUHA1eTFMMHVI?=
 =?utf-8?B?bDl2SStZNTJEaXduWTRVR09raHo3dXFhV1BncXYvdS9ReWpZYk1LUEFUN1FV?=
 =?utf-8?B?MTZGLzJ0a2dWNm1KdjVDcTJuV3o5WGxxb3R4bXowV09kbk1wSzBkcWRrQWtj?=
 =?utf-8?B?Q0pxOXBOb3VnYUdjU29zL0twNEY0T1dSSzZyUVJTUzJKQWJqSzk0UXcwaU9r?=
 =?utf-8?B?ZUpUMlp6RW15cjlzMjNzNlFEZHJocjc3dkp4eEZrdC9rRVdYV1FZQ3ZQLzlw?=
 =?utf-8?B?YzV5WC9nQXgvbklvRGtvczh1UHV6VFQ2dFVPQ3h4RWlnRURMM0hIYU1qT2hC?=
 =?utf-8?B?eDZOekFoZ25OanRtczdINTRaaGpnaW5Sc3R2TkVyNU91bXJ2ZU9ML3kvMTBm?=
 =?utf-8?B?UGpNZllldkpmdlUvL1Z5d1pSZ1lSZEx0RWhXcWNqczAxa3R0cC83ZE1LSzFP?=
 =?utf-8?B?RjMzL0lnY3U4NDdQOWNXWTRRRmVDK1kyc09pQmJtbXJLMWxCajlCanZqenVJ?=
 =?utf-8?B?a0puNk01SVJnTlNtL0JTOXNHbjBwbml4NVpUNXBVSytLYURMYUFMdCthLzc0?=
 =?utf-8?B?SGFITUg5RGh5U0FaMHJFangyd1A4aVlVdkNtRkFPTVc2M2dob3FpOTkyWFVW?=
 =?utf-8?B?c0lhb2w1TEpMcU56UlRQZ2hlNmZUZHc0MlN4ZzFIS2d2ZjFRV29oTVF3ZVZo?=
 =?utf-8?B?SHJrb3g3bUJ5UkUwcS9vUHd3ZmpHTzNDcXJybG9YUi9nb3g2U3J4YjltaC9R?=
 =?utf-8?B?YlhWREt0WVBacktERjVGRlh2OGI0VVYrNnRnRXpLYktmeGVsbHdhR0hsVmNC?=
 =?utf-8?B?SEJJY004V3g5WkhlMkhNekl5Q1RHQ0hJTjhucXNyNVZzYURjdDJ4MmpwUjRk?=
 =?utf-8?B?NW0yUGNjZTlwMXZTaUZpdGpLbERPdzRsSjhwSWxkMHZ3TkFuOVM5OGdielRI?=
 =?utf-8?B?VjRKeWw4eTh6bHgwZlZwWWJhZ0p3dlFlUzZOSnd0VGRSMUVNbHNmUFJBL1lW?=
 =?utf-8?B?RmtpUEFxSnJ3Mzl4VmxTU0NvWFAyM0tpN0VtWmhmVkVsRTBFL0ppbEJGMTJP?=
 =?utf-8?B?dUhYMS9xNWlidUlqNU1RUUFxSWpoaFFDS2FSeWdaS2ZmR1hVTUtkeWlISmph?=
 =?utf-8?B?ZHhYckZ5ZXo1ektrZHJOdzVpTGVpTUpDWnJneTVydm9TMnFpQ0NXZUFMVUQ1?=
 =?utf-8?B?Yi9lZVFKSkxuSXJSZ2pEZVkrVm5BZWNsYi9hMHNBbmlLL280aG1ZeXdvUHgw?=
 =?utf-8?B?SzFhVEZHL2w4WjhtQmlXakw2bWdCK2VYSUVQS1dhNGlpWkZNSTJvQWNHdERO?=
 =?utf-8?B?MjR1VS9GQkJxazM2NjN4d3NmT09CUWNwUkRjZ3lKdmsyRU1PS1hmK1lQOXM2?=
 =?utf-8?B?djN6YTg1LzJndldVNzIreXFwMjdqSEphS1NTaHBFdzBhczZBU0ZSc2ZsRUds?=
 =?utf-8?B?WGltZzJLcmUxSFlLQzNsTVQxVG9xcTdIb0x5dnpodkxHYVVPSkJaOVYyOStZ?=
 =?utf-8?B?Q3dGeVJSQTcwb213LzdXZFRVREpFM1BRVmFWQVZDRTMxMVd2aHFqUXRXYWdq?=
 =?utf-8?B?Q3B2MEdHWGs3aVFZemd4QUdZczJoRExablpJYitEdGNGUHNseGFGaE5FVFFH?=
 =?utf-8?B?YS9qdnoxN0pycjFPTC92elV0ZzcvWXFnYkFTcFhtWHhuWmRlbzVqT0w4VzVa?=
 =?utf-8?B?R3hmMnlvZUw1eU1QZHZlUHNTSXVteTl1Zi9tN0ZkMUlNMzgrTDN2anBNTXFN?=
 =?utf-8?B?WnJGd1o2cDNzemlDU3FUN0NEZ2Zod09hUDZVNSt3VEg4bWRzWGk2SitmOU9z?=
 =?utf-8?B?a0c5enRSRm5lOS9ic2ZpSXk3Q09SQWs0S1hqQVYvRXJQbnpCMjVQMGFWbWpr?=
 =?utf-8?B?dk9SZmpLVW04cXp6MmRYQThtaWVhUXRKREthL0VKRXFuSHR3QzZhSlRBOUdL?=
 =?utf-8?Q?whcbSLQjg7XfWTjFvubJq/8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e13597-1bd2-4ac2-5f0c-08d9e7eeade7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 14:57:35.7833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7nQb7CphjYvpM8acUFISJ7yW4fcxnEnmbeZApxg/UPb5JHredGnlslb0GX/bAk2GXtSzc4aN1eVbi4VC9pi1sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4494
X-OriginatorOrg: citrix.com

On Fri, Feb 04, 2022 at 02:43:07PM +0000, Oleksandr Andrushchenko wrote:
> 
> 
> On 04.02.22 15:06, Roger Pau Monné wrote:
> > On Fri, Feb 04, 2022 at 12:53:20PM +0000, Oleksandr Andrushchenko wrote:
> >>
> >> On 04.02.22 14:47, Jan Beulich wrote:
> >>> On 04.02.2022 13:37, Oleksandr Andrushchenko wrote:
> >>>> On 04.02.22 13:37, Jan Beulich wrote:
> >>>>> On 04.02.2022 12:13, Roger Pau Monné wrote:
> >>>>>> On Fri, Feb 04, 2022 at 11:49:18AM +0100, Jan Beulich wrote:
> >>>>>>> On 04.02.2022 11:12, Oleksandr Andrushchenko wrote:
> >>>>>>>> On 04.02.22 11:15, Jan Beulich wrote:
> >>>>>>>>> On 04.02.2022 09:58, Oleksandr Andrushchenko wrote:
> >>>>>>>>>> On 04.02.22 09:52, Jan Beulich wrote:
> >>>>>>>>>>> On 04.02.2022 07:34, Oleksandr Andrushchenko wrote:
> >>>>>>>>>>>> @@ -285,6 +286,12 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> >>>>>>>>>>>>                       continue;
> >>>>>>>>>>>>               }
> >>>>>>>>>>>>       
> >>>>>>>>>>>> +        spin_lock(&tmp->vpci_lock);
> >>>>>>>>>>>> +        if ( !tmp->vpci )
> >>>>>>>>>>>> +        {
> >>>>>>>>>>>> +            spin_unlock(&tmp->vpci_lock);
> >>>>>>>>>>>> +            continue;
> >>>>>>>>>>>> +        }
> >>>>>>>>>>>>               for ( i = 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
> >>>>>>>>>>>>               {
> >>>>>>>>>>>>                   const struct vpci_bar *bar = &tmp->vpci->header.bars[i];
> >>>>>>>>>>>> @@ -303,12 +310,14 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> >>>>>>>>>>>>                   rc = rangeset_remove_range(mem, start, end);
> >>>>>>>>>>>>                   if ( rc )
> >>>>>>>>>>>>                   {
> >>>>>>>>>>>> +                spin_unlock(&tmp->vpci_lock);
> >>>>>>>>>>>>                       printk(XENLOG_G_WARNING "Failed to remove [%lx, %lx]: %d\n",
> >>>>>>>>>>>>                              start, end, rc);
> >>>>>>>>>>>>                       rangeset_destroy(mem);
> >>>>>>>>>>>>                       return rc;
> >>>>>>>>>>>>                   }
> >>>>>>>>>>>>               }
> >>>>>>>>>>>> +        spin_unlock(&tmp->vpci_lock);
> >>>>>>>>>>>>           }
> >>>>>>>>>>> At the first glance this simply looks like another unjustified (in the
> >>>>>>>>>>> description) change, as you're not converting anything here but you
> >>>>>>>>>>> actually add locking (and I realize this was there before, so I'm sorry
> >>>>>>>>>>> for not pointing this out earlier).
> >>>>>>>>>> Well, I thought that the description already has "...the lock can be
> >>>>>>>>>> used (and in a few cases is used right away) to check whether vpci
> >>>>>>>>>> is present" and this is enough for such uses as here.
> >>>>>>>>>>>       But then I wonder whether you
> >>>>>>>>>>> actually tested this, since I can't help getting the impression that
> >>>>>>>>>>> you're introducing a live-lock: The function is called from cmd_write()
> >>>>>>>>>>> and rom_write(), which in turn are called out of vpci_write(). Yet that
> >>>>>>>>>>> function already holds the lock, and the lock is not (currently)
> >>>>>>>>>>> recursive. (For the 3rd caller of the function - init_bars() - otoh
> >>>>>>>>>>> the locking looks to be entirely unnecessary.)
> >>>>>>>>>> Well, you are correct: if tmp != pdev then it is correct to acquire
> >>>>>>>>>> the lock. But if tmp == pdev and rom_only == true
> >>>>>>>>>> then we'll deadlock.
> >>>>>>>>>>
> >>>>>>>>>> It seems we need to have the locking conditional, e.g. only lock
> >>>>>>>>>> if tmp != pdev
> >>>>>>>>> Which will address the live-lock, but introduce ABBA deadlock potential
> >>>>>>>>> between the two locks.
> >>>>>>>> I am not sure I can suggest a better solution here
> >>>>>>>> @Roger, @Jan, could you please help here?
> >>>>>>> Well, first of all I'd like to mention that while it may have been okay to
> >>>>>>> not hold pcidevs_lock here for Dom0, it surely needs acquiring when dealing
> >>>>>>> with DomU-s' lists of PCI devices. The requirement really applies to the
> >>>>>>> other use of for_each_pdev() as well (in vpci_dump_msi()), except that
> >>>>>>> there it probably wants to be a try-lock.
> >>>>>>>
> >>>>>>> Next I'd like to point out that here we have the still pending issue of
> >>>>>>> how to deal with hidden devices, which Dom0 can access. See my RFC patch
> >>>>>>> "vPCI: account for hidden devices in modify_bars()". Whatever the solution
> >>>>>>> here, I think it wants to at least account for the extra need there.
> >>>>>> Yes, sorry, I should take care of that.
> >>>>>>
> >>>>>>> Now it is quite clear that pcidevs_lock isn't going to help with avoiding
> >>>>>>> the deadlock, as it's imo not an option at all to acquire that lock
> >>>>>>> everywhere else you access ->vpci (or else the vpci lock itself would be
> >>>>>>> pointless). But a per-domain auxiliary r/w lock may help: Other paths
> >>>>>>> would acquire it in read mode, and here you'd acquire it in write mode (in
> >>>>>>> the former case around the vpci lock, while in the latter case there may
> >>>>>>> then not be any need to acquire the individual vpci locks at all). FTAOD:
> >>>>>>> I haven't fully thought through all implications (and hence whether this is
> >>>>>>> viable in the first place); I expect you will, documenting what you've
> >>>>>>> found in the resulting patch description. Of course the double lock
> >>>>>>> acquire/release would then likely want hiding in helper functions.
> >>>>>> I've been also thinking about this, and whether it's really worth to
> >>>>>> have a per-device lock rather than a per-domain one that protects all
> >>>>>> vpci regions of the devices assigned to the domain.
> >>>>>>
> >>>>>> The OS is likely to serialize accesses to the PCI config space anyway,
> >>>>>> and the only place I could see a benefit of having per-device locks is
> >>>>>> in the handling of MSI-X tables, as the handling of the mask bit is
> >>>>>> likely very performance sensitive, so adding a per-domain lock there
> >>>>>> could be a bottleneck.
> >>>>> Hmm, with method 1 accesses serializing globally is basically
> >>>>> unavoidable, but with MMCFG I see no reason why OSes may not (move
> >>>>> to) permit(ting) parallel accesses, with serialization perhaps done
> >>>>> only at device level. See our own pci_config_lock, which applies to
> >>>>> only method 1 accesses; we don't look to be serializing MMCFG
> >>>>> accesses at all.
> >>>>>
> >>>>>> We could alternatively do a per-domain rwlock for vpci and special case
> >>>>>> the MSI-X area to also have a per-device specific lock. At which point
> >>>>>> it becomes fairly similar to what you propose.
> >>>> @Jan, @Roger
> >>>>
> >>>> 1. d->vpci_lock - rwlock <- this protects vpci
> >>>> 2. pdev->vpci->msix_tbl_lock - rwlock <- this protects MSI-X tables
> >>>> or should it better be pdev->msix_tbl_lock as MSI-X tables don't
> >>>> really depend on vPCI?
> >>> If so, perhaps indeed better the latter. But as said in reply to Roger,
> >>> I'm not convinced (yet) that doing away with the per-device lock is a
> >>> good move. As said there - we're ourselves doing fully parallel MMCFG
> >>> accesses, so OSes ought to be fine to do so, too.
> >> But with pdev->vpci_lock we face ABBA...
> > I think it would be easier to start with a per-domain rwlock that
> > guarantees pdev->vpci cannot be removed under our feet. This would be
> > taken in read mode in vpci_{read,write} and in write mode when
> > removing a device from a domain.
> >
> > Then there are also other issues regarding vPCI locking that need to
> > be fixed, but that lock would likely be a start.
> Or let's see the problem at a different angle: this is the only place
> which breaks the use of pdev->vpci_lock. Because all other places
> do not try to acquire the lock of any two devices at a time.
> So, what if we re-work the offending piece of code instead?
> That way we do not break parallel access and have the lock per-device
> which might also be a plus.
> 
> By re-work I mean, that instead of reading already mapped regions
> from tmp we can employ a d->pci_mapped_regions range set which
> will hold all the already mapped ranges. And when it is needed to access
> that range set we use pcidevs_lock which seems to be rare.
> So, modify_bars will rely on pdev->vpci_lock + pcidevs_lock and
> ABBA won't be possible at all.

Sadly that won't replace the usage of the loop in modify_bars. This is
not (exclusively) done in order to prevent mapping the same region
multiple times, but rather to prevent unmapping of regions as long as
there's an enabled BAR that's using it.

If you wanted to use something like d->pci_mapped_regions it would
have to keep reference counts to regions, in order to know when a
mapping is no longer required by any BAR on the system with memory
decoding enabled.

Thanks, Roger.

