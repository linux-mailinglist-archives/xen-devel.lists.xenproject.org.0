Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3731E4803EA
	for <lists+xen-devel@lfdr.de>; Mon, 27 Dec 2021 20:06:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252062.433058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n1vIz-0004u9-77; Mon, 27 Dec 2021 19:05:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252062.433058; Mon, 27 Dec 2021 19:05:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n1vIz-0004s8-3k; Mon, 27 Dec 2021 19:05:09 +0000
Received: by outflank-mailman (input) for mailman id 252062;
 Mon, 27 Dec 2021 19:05:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/RQl=RM=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n1vIx-0004rv-2T
 for xen-devel@lists.xen.org; Mon, 27 Dec 2021 19:05:07 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3a4cd75-6747-11ec-bb0b-79c175774b5d;
 Mon, 27 Dec 2021 20:05:02 +0100 (CET)
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
X-Inumbo-ID: e3a4cd75-6747-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1640631901;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=8bAk6cUK4cCgJtsDXc5EpJH4dqB+y26qg8KEwwoopkc=;
  b=IpYYkKA9DGOnL5fgFK2DQJOn7nilNuhBKZs9OD1uzG6eOyCAW6wWT7tO
   9IpXPbEhX4KBC9PwFSGw5C9xWRkxhZ7kuZO3Ml8nAOOqBsoHV2ioYsZsZ
   UllBxvcl4Zxl0zUn0QKtxsZOoPxAHHlpcgKkpLfFsgEoVslsofXiHVfXk
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: lRXa0Z4RaBCuuZ7TmRXf43/D3R5q37Aky3qV8V6bEXBr1VokA+SjUGfUFj5cQOzqMNDSagbust
 QAL8J4IZRHzwQBbziCLgxG3biz+1/lNWINecp1xqayzAY2fESs4n4E33+RNNGEGNrySZhMgLzN
 CfVq3DPfzR4dPmq1b9yaxaUOfF+sWuZ3HAszlQVttbnl93pHIfAlWw4ggf9dbX4muXX9hJHUeC
 y3rFg4LdPAw8mNm4udXEW2OuBn9f188hl3eNeWhbtbBy3PO5zJXz6OXMWfVSzWZzA6fAD3QLmu
 UQl0uqjJ1Q3b45BMg3V/JrqV
X-SBRS: 5.1
X-MesageID: 62956082
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:OPnD6asF1/ScabvADyXyDZfya+fnVJlZMUV32f8akzHdYApBsoF/q
 tZmKWGOMveNY2PyLdhwbYqw9BlUvJDVmN5nGgZkrigyQiJD+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj29cy24fhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpliMW+ESxwb4D2wuEWTT1zAxtGL/BrweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2JofQKiGN
 5BxhTxHZTGdXixFYVcrOJMGueyFrEj/eCcCpwfAzUYwyzeKl1EguFT3C/LFd9rPSchLk0Kwo
 mPd43+/EhwcctuFxlKt/HO2i+rCgS78QqoPD7Ci7bhxh0CJzWEdDwcZWB29rOXRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiEPdsEY3Aot9Kbc/4x+p4bru2xTEK1FRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqWFo47eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl4gDGJGT9bxgbQ+0RqnBNzHJmRtR
 FBex6CjABkmVPlhbhClTuQXB62O7P2YKjDailMHN8B/q2zwpyL5It0PuGkWyKJV3iEsI2CBX
 aMukVkJuM870IWCM8ebnL5d++x1lPO9RLwJp9jfb8ZUY4gZSeN01HoGWKJk5Ei0yBJEufhmY
 f+zKJ/wZV5HWfUP5GfnHI81jO50rh3SMEuOHPgXOTz8iuHADJNUIJ9YWGazghcRsPnZ/V6Lq
 okHbKNnCXx3CYXDX8UeyqZKRXgiJnknH5Hm7ctRc++IOA19H289TfTWxNscl0ZNxsy5T8/Eo
 SOwXFF20l36iSGVIAmGcCk7OrjuQYx+vTQwOil1ZQSk3H0qYICO6qYDdsRoIel7pbI7lfMkH
 eMYf8igA+hUTmiV8ToqcpSg/pdpcw6mhFzSMnP9MiQ/ZZNpWyfA5sTgIln07CALAyfu7Zk+r
 rSs2xn1W50GQwg+Xs/aZOj2lwG6vGQHmfI0VEzNe4EBdELp+YlsCirwkv5ofJ1cdUSdnmOXj
 l/EDw0ZqO/Bp54O3OPI3a3U/Z20F+ZeH1ZBGzWJ57iBKiSHrHGoxpVNUbjUcGmFBn/04qire
 c5c0+r4bK8chF9PvodxT+RrwKY564e9rrNW1F05TnDCblDtAbJ8OHiWm8JIs/QVlLNevAK3X
 GOJ+8VbZurVaJ+0TgZJKVp3dPmH2NEVhiLWvKY8L0jN7SNq+KaKDBdJNB6WhS0BdLZ4PevJG
 wv6VBL6P+BnticXDw==
IronPort-HdrOrdr: A9a23:BY0XU6CxqHNOoCTlHemi55DYdb4zR+YMi2TDtnocdfUxSKelfq
 +V88jzuSWbtN9yYhEdcKG7WZVoKEm0nfQZ3WB7B8bAYOCJghrMEKhSqafk3j38C2nf24dmpM
 NdmnFFeb/NMWQ=
X-IronPort-AV: E=Sophos;i="5.88,240,1635220800"; 
   d="scan'208";a="62956082"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rg8M7blBKPKWWu5dMvhpRirHR63b2XxdSrZ9q3YuIjWB8K2gThAgwD5ppBc4NClojc+kEIFv4o2Jb0R+Q7m6nAakROHLhVfEP8ldHlaFJE+b5lnuTjeCI2UtLQuY53Kfi8Z8vD0nQVQ0sQHDUKp9ukqu+E4inPE3woeBJJaVcyczgj6Wal4y4DJ+Bw1dv8on1utVDvMhda33TVmqCHRneS25lRUvyva5whWO9nVRbdtaUbuzIAu3sPuBgwRYma/QlcSu22xRbpPsjnfDJu5bw+XT9wbA/ZEqwbmu0SYXwhOWzK7DKuJNM0t5KI+Ypfh61B7vomWSN6G3RafcLLwb4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xAk4XF8tvVh9xBscIEFUx52+6Fp2zsBn90ubOGdTIlU=;
 b=n31FWspLXqbYaHNM6XjYsh5UOAQzMhfghXLGeSocCLlBq1np24FOSe1YSYZo17NtS/mkKD2aXv7qCXbeZAQgRnjPEkm663sZCZd5y0A1SDIcfYJvmGhyI0K0j9m5oEGtJ1aO69ylefXf4EXAJr3CdiAYso40lnbBGI/5qfL42qeMngSMQCukHViQBv3sRdW84/hzj+mCCuL2GzTIF/WUQQ74jLgBjFyLZGEKLQzoduA4nNFDTSyHcbxIlOjZg35SC0QUW5z/KtBbI5aBgx+jFslyCqUiUATiy2BJe85h1TuRiuiqpuy7GDhnCy1oMdHWsmaFKRgocJ6U47OLc4RJPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xAk4XF8tvVh9xBscIEFUx52+6Fp2zsBn90ubOGdTIlU=;
 b=e76W33Pqx1YyLQ7kd3zhs2/vO7odbhKSbxccl+QoyZaQWreh4CXNZq6PwFe0VgVjjKmAQ3JnVxibI8xSteHwRd16pbo1y3zjNqXeGGJ0ixgIl5HuDhEVBa7qRsipaA3O08KIWm8XD1csILjlKsnK3wEbTZuUKGOQW+/0uowFg2o=
Date: Mon, 27 Dec 2021 20:04:51 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: G.R. <firemeteor@users.sourceforge.net>
CC: xen-devel <xen-devel@lists.xen.org>
Subject: Re: Possible bug? DOM-U network stopped working after fatal error
 reported in DOM0
Message-ID: <YcoOUw/u3SqTxWKm@Air-de-Roger>
References: <CAKhsbWZ5KCrwJqbchx31LWfaJeS=khP9sgoo4y8ZZqOexsUUdA@mail.gmail.com>
 <CAKhsbWYLC+cEuaJefi4Zy1ZcZaOtM6_2WV+9uq8=pTdi5NYLJA@mail.gmail.com>
 <CAKhsbWbv-Poscajj=Hwe3g6WO9b8VaZm39ygFnsbEfHTpRzrfA@mail.gmail.com>
 <YcHbuug9AECvKXm9@Air-de-Roger>
 <CAKhsbWZkSoM-N=HXfb_OeSGLqYMdtcxRph+=_vqp6tjHgikYVQ@mail.gmail.com>
 <YcInKtCNgA9v0k+c@Air-de-Roger>
 <CAKhsbWZMRMfrsWDcZLSS7q4ciR0UbyGE2sO-tN1dr+9juuEfsQ@mail.gmail.com>
 <YcWuCgYWestnlDSH@Air-de-Roger>
 <CAKhsbWZ4Xyy_7Xp4F3YWNsrBXdh4AkiQx4__7qUTd4AJiu-6bg@mail.gmail.com>
 <CAKhsbWarxwi_n3NAr81op_apyN69itUrv7f1k1ZJ6=gXuFXtGA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKhsbWarxwi_n3NAr81op_apyN69itUrv7f1k1ZJ6=gXuFXtGA@mail.gmail.com>
X-ClientProxiedBy: MR1P264CA0003.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::8) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54145521-2b54-4371-c8d1-08d9c96bc5d5
X-MS-TrafficTypeDiagnostic: DM6PR03MB5178:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB51780B0F6E300334F72C75258F429@DM6PR03MB5178.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eMAuuMhhuI1Oj6VBiPNaYrcowMzFaVIecj7QEwoEopRuxWSZ7loFN7gjQAawC7PcMMJCoBw8Xgs8vXIqxlG0uiw/RrNkpIGaO6WcsoxaJM6dwUrFJLU/aIPD7UnowYXxpJs0EGAZouvHtGw6ZBm9s/i701MVw1L08nHFTnWUBVxdp3nBu/5biL2cZ0TpGvb5wW5hKpBEiSOH9neN/4kQ6MhWOPD9IELb7PORovmbMWlUaVPmXrveBjkwIUHtNM1zPsfxnFQknFqCnZnKZnlbCj3s9130DhCUceyqe2WgLVOmUCj7EFlAZToO8aq63ZAdvP+C39gEJ692L2Pg+E6P856LNJsA/+DPfTl3yVgCXDrzHsqEW1/b6CbjF+HOeK39yCNwtlHAwVCnYZihmRRsh1cY9KE9TDqGyKpIzAeQT/t/Sh/f2RL6L38VqaC6NJIr2xdLMx6kkiTFA8f4hv8sKYOxa3R2cy29B/vBbvqloq+cFqQvZ5MUeCkoLqAKZn8HAAPK+MwOPgBWK98LurR6VGFzz2kPg2+1PAZIl3M8ELlV9yAHuwwG0bviyzAa4l+x/xEhR97jN05cjOwDDzx4Z6CV73oribMS7N89MYK8U1ZtnxEpw4u/Np+41wElsbtHtCs0QQ2u0H/Srz3dp0pdYlBu5C99NJ84LwjYKDe/3Fsxo9DtWFdN/Nchb3LfiDMk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(83380400001)(85182001)(6666004)(4326008)(6506007)(9686003)(186003)(33716001)(8676002)(26005)(8936002)(38100700002)(5660300002)(6512007)(2906002)(6486002)(82960400001)(316002)(508600001)(66946007)(6916009)(86362001)(66556008)(66476007)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGVXRkhEeUM0YzF2VFFaQ1RYbVVySi9WY09QNGIyeHI3bk5xUGJKRCtTY1l0?=
 =?utf-8?B?cldDK3VTZkdCWlpsMkxTbHYrY0hmY2xqRit5YUV1ZUE5c056bGhrQ3o0OHZC?=
 =?utf-8?B?SU5FSFdjSXZjbUZteEtXd2VzanZicE1RbDIrOFlmSU5CNHlxY2RMMTlkZUxr?=
 =?utf-8?B?MXlLQi9mQ3ZpT0c1YzMvdFhwTm9oRFBrYU5VeUNDUDN3cnJpTzNwdGFWWHRE?=
 =?utf-8?B?R2w5amFMcTdHMnN6UXZ5cFYrVEc0VkFwTmdvOVViMG1jKzhxTksrR2ZPcm9S?=
 =?utf-8?B?TEhXaW8wVWpabVY2dWo5bW5pWVVVL2d1bUxzZlNxWSs5ZW9ReXRPRExXSm5F?=
 =?utf-8?B?ZS9zUE1obFM1dXVLeGJXd01SWk16MlExc1RrTXZNTFZCTWdDSWU4MVZWaE1C?=
 =?utf-8?B?b2hYNEVCNzZWTnQ5WC84Z01yNmJwM3ZEeGdpZFVLMEdQUXk4b2ZES1ZRSG8v?=
 =?utf-8?B?VEpEdFJnd0IzeEJTa1VOOEtWSEFYWkJWckFrVGE1YlJPc3UrNjFBWUNPUmN2?=
 =?utf-8?B?YSs4ZS9uNkVwUWhZMDB4R012TEdxMDMwZEJCRkZVb1NpVjR6bGZhRlpsU244?=
 =?utf-8?B?SGFJT29qeUExRk5yc0RNUGJoNmVNcWp0YldpelUvWlJYZ0tqblRvTjlna2hV?=
 =?utf-8?B?eGlCdHQyZzdsODhxMWk5VXRuQ2VocXhjMDBxMTRVcmxPOUVVWHEvcFhWb1Q3?=
 =?utf-8?B?Zk9nS0hGZ2tpcVRLWVhlSXdWNVpWNHR4OEwyakptMkVUNHUrVW5FS2s2U25k?=
 =?utf-8?B?Q0tRZTF3YUxyV0tFdDZJcEx3eWE4QzNJOXFYTWVNaktMUzFFSGJmMHNVVXhU?=
 =?utf-8?B?WElLZjdIYnRvWnZCTVBxQ2E1N0t4Nmt2UkN0Qy91UTlXQkJvaEcxM1JzZ1ZP?=
 =?utf-8?B?UkhpaFRrWFNQYXJEZFR5a201MzZWZ1hzTGtpalp4dURMcDdIOVp6T3RVclJF?=
 =?utf-8?B?MTMvenhWWUhXRU9hWW1KNWk1MkMvNVpzUmNXRXBuVCtRbEpDMDd6QzhyTTBv?=
 =?utf-8?B?ckpJOWJsbm1BVHdHcHh6OXh5QTdtUTV2UU4xRGhHS2dOT3NsTFBiZnNNUENN?=
 =?utf-8?B?cGlwVmFRUGJkL1FPSEUwYzUxTnlOdWQ2ajUyTFlSaDBWVS8zNm53cHMrUmE4?=
 =?utf-8?B?N1hkWGdKZHR4L3EvTG5MZWI4aUxINTNzdXFYb0dHZS9YanBtWlhxMms5T0xV?=
 =?utf-8?B?ZnYva0hhaTBWaXM2M2FZR1RSUzlOVHN3bkZyeWtITUs1QVV0dDhGUzkyZXhi?=
 =?utf-8?B?Q0JNank5a3F5ZXlhUEEyT084QnVyRGRmdEpXL2VGRzhyNGROZWtCSzhxR0tG?=
 =?utf-8?B?NHRKRm42bFE5WGRzMHpod29VRTlyTCtOQ2s4Z04vVWhZTWlRMlpqUFRwdUJR?=
 =?utf-8?B?TGhEeCtESGFmQWU3bFFlZWo0eVdJVFV4YUdWSzNZY012UFp1UVpTR3EyYWd6?=
 =?utf-8?B?QU9ndDh0UmdhcVBMNklaYlp2VGF0THUzVDdIa3ZCNTd6YzNlSzl0MnpWWWlr?=
 =?utf-8?B?R0dDbUI1a2FBZElTODZVZzFLNWVCdVFUMW1GOFhUVm44WjVtT2ROMkNTbGpz?=
 =?utf-8?B?anRkOVVZL0xmek92elNKYVZoMEVkM2t3K2FIem5uVnV0Q3lUY3BJK2JOL0V1?=
 =?utf-8?B?M3dNMnpReDM4bmpjYmFmUHdwc3hxSHdvTXVLRWtOWW9Scjk3MjNOYitzVGhq?=
 =?utf-8?B?dS9mN2V2KzVSU09lbFcvVXZzcmx4ZFJpRHdUbHF6d2lkRWtKMTd5VzRCMlcw?=
 =?utf-8?B?Q1p0WjQ4WW9XRHg0dzIzcGZyclprdFBDVnZXc3dHSTJhcGZwYlZBbkJBekRD?=
 =?utf-8?B?SllFK1dERzg3NmZmbzAzL2hmK2Y0RVFWcWZwTnZzSXA4VUNqeVJFd3JCUVcz?=
 =?utf-8?B?OVhrZm1qNVYyOHZrOWVCcFdiYWRxMitPdTVtN2dMZkttTmh5N2gwTDhtVFJK?=
 =?utf-8?B?MCtZdnBMWE1JRmJZY3YydGNzVldxNWxpK2dLaW9yaTFRUGVySi9oTTNxZVZK?=
 =?utf-8?B?WXdVQ0lqU3ptaTc2TGtSWEZkRTVNOG5XaGVFbWIzSlI3RUd3SWFpZjFhMGFR?=
 =?utf-8?B?N0w5cU1TbDdEd2JzSlJPUDV1L2s3aDUySVFUSmdDT0JjclVreWsvU0EvWGFI?=
 =?utf-8?B?MTRueTRJRnN2dkpUZGdPeXdXdG1sUW9OeGdDcXYyZi9mVjdtb21wcS9zdHJC?=
 =?utf-8?Q?DfqS/Ju96/i5S07Yarn3xiE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54145521-2b54-4371-c8d1-08d9c96bc5d5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2021 19:04:56.9003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: enL26twGN6c/1iULmazCtQ4cGf8HDcK4QNYXCyeselCnm9bgJisvjrV9b+1iAAPN3ZK63gURiIsTB/RTsLk77A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5178
X-OriginatorOrg: citrix.com

On Sun, Dec 26, 2021 at 02:06:55AM +0800, G.R. wrote:
> > > Thanks. I've raised this on freensd-net for advice [0]. IMO netfront
> > > shouldn't receive an mbuf that crosses a page boundary, but if that's
> > > indeed a legit mbuf I will figure out the best way to handle it.
> > >
> > > I have a clumsy patch (below) that might solve this, if you want to
> > > give it a try.
> >
> > Applied the patch and it worked like a charm!
> > Thank you so much for your quick help!
> > Wish you a wonderful holiday!
> 
> I may have said too quickly...
> With the patch I can attach the iscsi disk and neither the dom0 nor
> the NAS domU complains this time.
> But when I attempt to mount the attached disk it reports I/O errors randomly.
> By randomly I mean different disks behave differently...
> I don't see any error logs from kernels this time.
> (most of the iscsi disks are NTFS FS and mounted through the user mode
> fuse library)
> But since I have a local backup copy of the image, I can confirm that
> mounting that backup image does not result in any I/O error.
> Looks like something is still broken here...

Indeed. That patch was likely too simple, and didn't properly handle
the split of mbuf data buffers.

I have another version based on using sglist, which I think it's also
a worthwhile change for netfront. Can you please give it a try? I've
done a very simple test and seems fine, but you certainly have more
interesting cases.

You will have to apply it on top of a clean tree, without any of the
other patches applied.

Thanks, Roger.
---
diff --git a/sys/dev/xen/netfront/netfront.c b/sys/dev/xen/netfront/netfront.c
index 8dba5a8dc6d5..37ea7b1fa059 100644
--- a/sys/dev/xen/netfront/netfront.c
+++ b/sys/dev/xen/netfront/netfront.c
@@ -33,6 +33,8 @@ __FBSDID("$FreeBSD$");
 #include "opt_inet.h"
 #include "opt_inet6.h"
 
+#include <sys/types.h>
+
 #include <sys/param.h>
 #include <sys/sockio.h>
 #include <sys/limits.h>
@@ -40,6 +42,7 @@ __FBSDID("$FreeBSD$");
 #include <sys/malloc.h>
 #include <sys/module.h>
 #include <sys/kernel.h>
+#include <sys/sglist.h>
 #include <sys/socket.h>
 #include <sys/sysctl.h>
 #include <sys/taskqueue.h>
@@ -199,6 +202,12 @@ struct netfront_txq {
 	struct taskqueue 	*tq;
 	struct task       	defrtask;
 
+	struct sglist 		*segments;
+	struct mbuf_refcount {
+		struct m_tag 	tag;
+		u_int 		count;
+	}			refcount_tag[NET_TX_RING_SIZE + 1];
+
 	bool			full;
 };
 
@@ -301,6 +310,38 @@ xn_get_rx_ref(struct netfront_rxq *rxq, RING_IDX ri)
 	return (ref);
 }
 
+#define MTAG_REFCOUNT 0
+
+static void mbuf_grab(uint32_t cookie, struct mbuf *m)
+{
+	struct mbuf_refcount *ref;
+
+	ref = (struct mbuf_refcount *)m_tag_locate(m, cookie, MTAG_REFCOUNT,
+	    NULL);
+	KASSERT(ref != NULL, ("Cannot find refcount"));
+	ref->count++;
+}
+
+static void mbuf_release(uint32_t cookie, struct mbuf *m)
+{
+	struct mbuf_refcount *ref;
+
+	ref = (struct mbuf_refcount *)m_tag_locate(m, cookie, MTAG_REFCOUNT,
+	    NULL);
+	KASSERT(ref != NULL, ("Cannot find refcount"));
+	KASSERT(ref->count > 0, ("Invalid reference count"));
+
+	if(--ref->count == 0)
+		m_freem(m);
+}
+
+static void tag_free(struct m_tag *t)
+{
+	struct mbuf_refcount *ref = (struct mbuf_refcount *)t;
+
+	KASSERT(ref->count == 0, ("Free mbuf tag with pending refcnt"));
+}
+
 #define IPRINTK(fmt, args...) \
     printf("[XEN] " fmt, ##args)
 #ifdef INVARIANTS
@@ -778,7 +819,7 @@ disconnect_txq(struct netfront_txq *txq)
 static void
 destroy_txq(struct netfront_txq *txq)
 {
-
+	sglist_free(txq->segments);
 	free(txq->ring.sring, M_DEVBUF);
 	buf_ring_free(txq->br, M_DEVBUF);
 	taskqueue_drain_all(txq->tq);
@@ -826,6 +867,11 @@ setup_txqs(device_t dev, struct netfront_info *info,
 		for (i = 0; i <= NET_TX_RING_SIZE; i++) {
 			txq->mbufs[i] = (void *) ((u_long) i+1);
 			txq->grant_ref[i] = GRANT_REF_INVALID;
+			m_tag_setup(&txq->refcount_tag[i].tag,
+			    (unsigned long)txq, MTAG_REFCOUNT,
+			    sizeof(txq->refcount_tag[i]) -
+			    sizeof(txq->refcount_tag[i].tag));
+			txq->refcount_tag[i].tag.m_tag_free = &tag_free;
 		}
 		txq->mbufs[NET_TX_RING_SIZE] = (void *)0;
 
@@ -874,10 +920,18 @@ setup_txqs(device_t dev, struct netfront_info *info,
 			device_printf(dev, "xen_intr_alloc_and_bind_local_port failed\n");
 			goto fail_bind_port;
 		}
+
+		txq->segments = sglist_alloc(MAX_TX_REQ_FRAGS, M_WAITOK);
+		if (txq->segments == NULL) {
+			device_printf(dev, "failed to allocate sglist\n");
+			goto fail_sglist;
+		}
 	}
 
 	return (0);
 
+fail_sglist:
+	xen_intr_unbind(&txq->xen_intr_handle);
 fail_bind_port:
 	taskqueue_drain_all(txq->tq);
 fail_start_thread:
@@ -1041,7 +1095,7 @@ xn_release_tx_bufs(struct netfront_txq *txq)
 		if (txq->mbufs_cnt < 0) {
 			panic("%s: tx_chain_cnt must be >= 0", __func__);
 		}
-		m_free(m);
+		mbuf_release((unsigned long)txq, m);
 	}
 }
 
@@ -1311,7 +1365,7 @@ xn_txeof(struct netfront_txq *txq)
 			txq->mbufs[id] = NULL;
 			add_id_to_freelist(txq->mbufs, id);
 			txq->mbufs_cnt--;
-			m_free(m);
+			mbuf_release((unsigned long)txq, m);
 			/* Only mark the txq active if we've freed up at least one slot to try */
 			ifp->if_drv_flags &= ~IFF_DRV_OACTIVE;
 		}
@@ -1507,22 +1561,6 @@ xn_get_responses(struct netfront_rxq *rxq,
 	return (err);
 }
 
-/**
- * \brief Count the number of fragments in an mbuf chain.
- *
- * Surprisingly, there isn't an M* macro for this.
- */
-static inline int
-xn_count_frags(struct mbuf *m)
-{
-	int nfrags;
-
-	for (nfrags = 0; m != NULL; m = m->m_next)
-		nfrags++;
-
-	return (nfrags);
-}
-
 /**
  * Given an mbuf chain, make sure we have enough room and then push
  * it onto the transmit ring.
@@ -1530,16 +1568,22 @@ xn_count_frags(struct mbuf *m)
 static int
 xn_assemble_tx_request(struct netfront_txq *txq, struct mbuf *m_head)
 {
-	struct mbuf *m;
 	struct netfront_info *np = txq->info;
 	struct ifnet *ifp = np->xn_ifp;
-	u_int nfrags;
-	int otherend_id;
+	u_int nfrags, i;
+	int otherend_id, rc;
+
+	sglist_reset(txq->segments);
+	rc = sglist_append_mbuf(txq->segments, m_head);
+	if (rc != 0) {
+		m_freem(m_head);
+		return (rc);
+	}
 
 	/**
 	 * Defragment the mbuf if necessary.
 	 */
-	nfrags = xn_count_frags(m_head);
+	nfrags = txq->segments->sg_nseg;
 
 	/*
 	 * Check to see whether this request is longer than netback
@@ -1551,6 +1595,8 @@ xn_assemble_tx_request(struct netfront_txq *txq, struct mbuf *m_head)
 	 * the Linux network stack.
 	 */
 	if (nfrags > np->maxfrags) {
+		struct mbuf *m;
+
 		m = m_defrag(m_head, M_NOWAIT);
 		if (!m) {
 			/*
@@ -1561,11 +1607,15 @@ xn_assemble_tx_request(struct netfront_txq *txq, struct mbuf *m_head)
 			return (EMSGSIZE);
 		}
 		m_head = m;
+		sglist_reset(txq->segments);
+		rc = sglist_append_mbuf(txq->segments, m_head);
+		if (rc != 0) {
+			m_freem(m_head);
+			return (rc);
+		}
+		nfrags = txq->segments->sg_nseg;
 	}
 
-	/* Determine how many fragments now exist */
-	nfrags = xn_count_frags(m_head);
-
 	/*
 	 * Check to see whether the defragmented packet has too many
 	 * segments for the Linux netback driver.
@@ -1604,14 +1654,15 @@ xn_assemble_tx_request(struct netfront_txq *txq, struct mbuf *m_head)
 	 * the fragment pointers. Stop when we run out
 	 * of fragments or hit the end of the mbuf chain.
 	 */
-	m = m_head;
 	otherend_id = xenbus_get_otherend_id(np->xbdev);
-	for (m = m_head; m; m = m->m_next) {
+	for (i = 0; i < nfrags; i++) {
 		netif_tx_request_t *tx;
 		uintptr_t id;
 		grant_ref_t ref;
 		u_long mfn; /* XXX Wrong type? */
+		struct sglist_seg *seg;
 
+		seg = &txq->segments->sg_segs[i];
 		tx = RING_GET_REQUEST(&txq->ring, txq->ring.req_prod_pvt);
 		id = get_id_from_freelist(txq->mbufs);
 		if (id == 0)
@@ -1621,17 +1672,22 @@ xn_assemble_tx_request(struct netfront_txq *txq, struct mbuf *m_head)
 		if (txq->mbufs_cnt > NET_TX_RING_SIZE)
 			panic("%s: tx_chain_cnt must be <= NET_TX_RING_SIZE\n",
 			    __func__);
-		txq->mbufs[id] = m;
+		if (i == 0)
+			m_tag_prepend(m_head, &txq->refcount_tag[id].tag);
+		mbuf_grab((unsigned long)txq, m_head);
+		txq->mbufs[id] = m_head;
 		tx->id = id;
 		ref = gnttab_claim_grant_reference(&txq->gref_head);
 		KASSERT((short)ref >= 0, ("Negative ref"));
-		mfn = virt_to_mfn(mtod(m, vm_offset_t));
+		mfn = atop(seg->ss_paddr);
 		gnttab_grant_foreign_access_ref(ref, otherend_id,
 		    mfn, GNTMAP_readonly);
 		tx->gref = txq->grant_ref[id] = ref;
-		tx->offset = mtod(m, vm_offset_t) & (PAGE_SIZE - 1);
+		tx->offset = seg->ss_paddr & PAGE_MASK;
+		KASSERT(tx->offset + seg->ss_len <= PAGE_SIZE,
+		    ("mbuf segment crosses a page boundary"));
 		tx->flags = 0;
-		if (m == m_head) {
+		if (i == 0) {
 			/*
 			 * The first fragment has the entire packet
 			 * size, subsequent fragments have just the
@@ -1640,7 +1696,7 @@ xn_assemble_tx_request(struct netfront_txq *txq, struct mbuf *m_head)
 			 * subtracting the sizes of the other
 			 * fragments.
 			 */
-			tx->size = m->m_pkthdr.len;
+			tx->size = m_head->m_pkthdr.len;
 
 			/*
 			 * The first fragment contains the checksum flags
@@ -1654,12 +1710,12 @@ xn_assemble_tx_request(struct netfront_txq *txq, struct mbuf *m_head)
 			 * so we have to test for CSUM_TSO
 			 * explicitly.
 			 */
-			if (m->m_pkthdr.csum_flags
+			if (m_head->m_pkthdr.csum_flags
 			    & (CSUM_DELAY_DATA | CSUM_TSO)) {
 				tx->flags |= (NETTXF_csum_blank
 				    | NETTXF_data_validated);
 			}
-			if (m->m_pkthdr.csum_flags & CSUM_TSO) {
+			if (m_head->m_pkthdr.csum_flags & CSUM_TSO) {
 				struct netif_extra_info *gso =
 					(struct netif_extra_info *)
 					RING_GET_REQUEST(&txq->ring,
@@ -1667,7 +1723,7 @@ xn_assemble_tx_request(struct netfront_txq *txq, struct mbuf *m_head)
 
 				tx->flags |= NETTXF_extra_info;
 
-				gso->u.gso.size = m->m_pkthdr.tso_segsz;
+				gso->u.gso.size = m_head->m_pkthdr.tso_segsz;
 				gso->u.gso.type =
 					XEN_NETIF_GSO_TYPE_TCPV4;
 				gso->u.gso.pad = 0;
@@ -1677,9 +1733,9 @@ xn_assemble_tx_request(struct netfront_txq *txq, struct mbuf *m_head)
 				gso->flags = 0;
 			}
 		} else {
-			tx->size = m->m_len;
+			tx->size = seg->ss_len;
 		}
-		if (m->m_next)
+		if (i != nfrags - 1)
 			tx->flags |= NETTXF_more_data;
 
 		txq->ring.req_prod_pvt++;


