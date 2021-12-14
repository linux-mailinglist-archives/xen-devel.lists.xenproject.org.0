Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD4C474632
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 16:18:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246844.425708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx9Z5-00083H-BH; Tue, 14 Dec 2021 15:18:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246844.425708; Tue, 14 Dec 2021 15:18:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx9Z5-00081T-71; Tue, 14 Dec 2021 15:18:03 +0000
Received: by outflank-mailman (input) for mailman id 246844;
 Tue, 14 Dec 2021 15:18:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xzzU=Q7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mx9Z3-00081D-Qg
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 15:18:01 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 057b74c3-5cf1-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 16:18:00 +0100 (CET)
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
X-Inumbo-ID: 057b74c3-5cf1-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639495080;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=1jbemwLAmtHI34QcQmbKlum9w8py18HrlyvXIj1QkzQ=;
  b=ewAHiciJAjHnYNNIZ+CSMKqYoJ0nTf3JJHc6YMkzSvFwTpoi8Q78UZpZ
   mCTCpIU8nyhUfDS8u4nNqFB31+GzztWiPQVS65DQvgq6bqN3DIHn//FSL
   wCrDi+xerP3TN/xE3NelWHIukBioM/W7Dmh5Dsf5aWJrLKAP4hTjJ2zFF
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: DHwFUt6SWcOpMxXlWgS4Y3R1+5eWU9P1A7a9Apdxg7hx3V0GFQIjOj98k0fYRUd2fwrpyQPPmN
 +Tqk4S+AxJla55hWpmR4RZIRX3Jp9rhfxgRtKlRbezI2Oq5c7P3SlU5KiKaF7RSVCs1J2O65lx
 IKRPTotbb28Akd86V+LfDwZOcGw0grjloxODQDQpzREjlMZj2nWQk8gD3/tIRvAvrWJy9P2FAg
 O/fsJgom07MCuRGqaZabzKJ5He9kF0pKuYf4Z7CRy5l0bu1PJciXwXXVgoKP/BMJgvtiQUAKMG
 cZCAKyeZpvaoLfg1OqroWlvZ
X-SBRS: 5.1
X-MesageID: 59987521
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:3JXI1q/kXh/jqM0BMcvCDrUDd3mTJUtcMsCJ2f8bNWPcYEJGY0x3y
 GoZUG/TaKqMMTb1eI1/b4+/oUsC6Jfczt42HAs9r3o8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug6wrRg3tYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhN2
 c4WuLiAeDsyI4vAnrsdWCBjSApXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcFjWZg2Z0URJ4yY
 eILeR5pd07pYCd3K3FIT84luML5glvWJmgwRFW9+vNsvjm7IBZK+KDkLd79atGMA8JPkS6wp
 W/Y/mK/HhATMvSezyaI9jSngeqntSHxVZ8WFba43uV3m1DVzWsWYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQnZKflkdCAZwKSbR8sVzTjPqPi+qEOoQaZgJQc4crkP8HeSc38
 FOPwNPiPAc0m5TAHBpx6YyohT+1PCEUK0oLaikFURYJ7rHfnW0jsv7cZo09SfDo17UZDRm1m
 mnX93Zm293/mOZSj/3jlW0rlQ5AsXQgouQdwgzMFlyo4QpiDGJOT9z5sAOLhRqswWvwc7Vgg
 JTms5TOhAztJcvU/MBofAnrNOv2jxpiGGeD6WOD57F7q1yQF4eLJOi8Gg1WKkZzKdojcjT0e
 kLVsg45zMYNZyr2N/YvPtzuWpRCIU3c+TLNDK+8gj1mOMcZSeN61Hs2OR74M57FziDAbp3Ty
 b/EKJ3xXB72+IxszSasRvd17FPY7ntW+I8nfriil07P+ePHPBa9EO5ZWHPTP7hRxP7V+239r
 ocAX/ZmPj0CCYUSlAGMqtVNRb3LRFBmba3LRzt/KrTef1E4QT55UJc8A9oJIuRYokicrc+Rl
 lmVUU5E0lvvw3rBLASBcHd4b73zG514qBoG0eYEZD5EAlAvPtSi6rkxbZwyceV1/eBv16csH
 fIEZ9+BErJETTGeo2YRapz0rYpDchW3hF3RY3r5MWZnJ5MwFRbU/tLEfxf08HVcBCSAqsZj8
 aar0RnWQMRfSl06XtrWcv+m03i4oWMZxLBpR0LNL9QKIBfs/YFmJjbflPgyJ81QexzPyiHDj
 1SdAAsCpPmLqIgwqYGbiaeBpoavMu1/AksFQDWLsefobXHXpzPxz5VBXeCEeSHmeFn1oKjyN
 /9Iy/zcMeEcmAoYuYRLDLs2n7k14MHipuEGw108TmnLdVmiFphpPmKCgZtUrqRIy7JU5Vm2V
 0aI9oUIMLmFIpq4QlsYJQ5jZeWfz/AE3DLV6K1tckn94SZ2+puBUFlTYEbQ2HAMcuMtPdN32
 /olte4X9xe720gjPduxhyxJ83iBcy4bWKI9u5BGWILmh2LHEL2ZjUAw3sMu3KyyVg==
IronPort-HdrOrdr: A9a23:XiGx/6G0yHYSBh6SpLqFd5HXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HmBEClewKnyXcT2/htAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtRD4b7LfClHZKTBkXCF+r8bqbHtmsDY5ts2jU0dNT2CA5sQkTuRYTzrdHGeKjM2YabQQ/
 Gnl7V6TnebCD4qhoPRPAhxY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX202oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iAnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJDQ4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWAqqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocZTbqjVQGbgoBT+q3vYpxqdS32B3Tq+/blnAS+pUoJj3fxn6ck7zM9HJFUcegz2w
 2LCNUuqFh0dL5kUUtKPpZ3fSKGMB28ffvyChPhHb3GLtBOB5ufke+93F0KjNvaDKDgiqFC3q
 j8bA==
X-IronPort-AV: E=Sophos;i="5.88,205,1635220800"; 
   d="scan'208";a="59987521"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DSClVzpt+BJUaqBE47pkj7pXZ2IZxx++eUqCcTY4NBvKCqgcMhsm+G6qT7JY72EIkSUNf4+35dqzbI8QuGna8zZKW5/A4fP5be+JZbVxNZGvZkWLGj7lPDugcjmrrFBCacKy96wiBeKeMnrQik/fSF3+3rzvW9R5Ef8Y3dVEtC+j1zm+QvYPHMqCxHYG6UA4e105j8p+eoE+XkF+myhYcyNijtruTQDhKbUHfEdtYaYmy0xbhseMng4g8la4POrLI31+tiktzur+5hVgTsL0qiKCEaTRf80GMX0bqz2LqprTOGVfU31ibMWORE8ENMAzdw0Tf+tWaPN5JQaKCukrgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybmFtDqrVx/mRF0CGZIbVJlc1SQ5iCYRNRu95LmTnmE=;
 b=e8uhzoJ2zUhh8Lgv8TAbDHdDtdyXgB8sMwgMsTD5EJ/ooxHaHh+f7rUc2K7fvZSzwHgdGtrjhVs4ZWwjf9JoTBM0oA2/5zjfyBhoaIvnHrcLcUgh+W7bVATvOdz9KeN9ZUTxSC5mK12gudrSWK5a5ASR1bDu7vQN4VgvRRue7rgKCXkyBUXiFRKv3wl3CMmRMjnTGNGyDOdQiyjAefUb43tglLT0C4vihjH//NYt6yidNNF3+bfDK6XktzPbub2Mp1rhFhmKkCHfmr0yQR4b/MttSzlwzE/jXxfvjqhwqRXyep46RetsdDxV2Vco0HRV60U3zzeCZ3KRJxv4FQtnUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybmFtDqrVx/mRF0CGZIbVJlc1SQ5iCYRNRu95LmTnmE=;
 b=ulsdjIE0/A9YD52GdAme2Otc4D/bKwa9z/z4qFnI85Qmy4VIzQ3W79G/G9MWZ1UotudYokdOxFw33RLjbwaXsvC0zwUUG2WzxIFX5L/GGRnbph/2lK6qV02wMozRysJhNKUW81yv5lnC8N6Jqfl8J9i1N0B3qhlh42H1FOwt3JU=
Date: Tue, 14 Dec 2021 16:17:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>, Kevin Tian
	<kevin.tian@intel.com>
Subject: Re: [PATCH v2 15/18] IOMMU/x86: prefill newly allocate page tables
Message-ID: <Ybi1n5uyLop/4wh5@Air-de-Roger>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <2656844d-47cc-70c3-d7ce-7d83967d576e@suse.com>
 <YbizA1adGRRIlcTv@Air-de-Roger>
 <d05185f5-7ef3-4a76-60d1-0db38041baae@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d05185f5-7ef3-4a76-60d1-0db38041baae@suse.com>
X-ClientProxiedBy: FR0P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c393de3-1d61-4a80-98c9-08d9bf14e7b4
X-MS-TrafficTypeDiagnostic: DM5PR03MB2490:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <DM5PR03MB2490B1B39A4F9C27174888F98F759@DM5PR03MB2490.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 16DEIF3neIo+hlItoTgTW75n3zFY2kYgqbD+/GqsPQBHd0R5HucKGhwz9uQLd8u/rYsYnw/jDc16qEdHBKHgAemkDUosOraljm8ufQkEtZ2Nw0k3OAZbuXLshzyYXEtRgBA0S61Nnx+lNpxqrYpXkuZUZXqGgcvPEkv3yKUNV9G/Wm6KYf2Hr3is6H4xU+xFRJTKxb0CYe5sdDlnSAtyD0i32ejDggFOU33R7Qn+Gu7Bja8ZuS94NRYdpA8kopQpqmVDa6WR6+sAqkuFPM/vqDWACLxf9gOC4V/hJCRGQwg8fYww+YsGgasaWxfDVGCB+4cOMyonovirFB/3trtyvIx4k4Ie7F9XtB678aAmGHQvlxwQx3cuVcSOMuT1rSLdO1bKtvaIJwMNySItVXe/UEIsqQqUtej+id0eZfWbHxj7iJTOkobTF54jGjVPZSe5h/rTtjhErwq1GTU8SGes6g4W79soqV/pI8dsljeu1oiogScVECXHaMG7ENvhU55ilm3u1i7GSlMTRHznzVsyMbfHUaJg7ydjtg6WSmLLuAwbPCuUL47Np9HCpbgs2m/AdX13xMyWKPqJL7+iNPpnIP8PEg3/RHp0jiUb4pxa5rWBH4IHlfQdaYf8oNpoEk0zGHHdgZ1toraR11Yt4nM2NA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(33716001)(4326008)(6506007)(53546011)(85182001)(508600001)(54906003)(6666004)(26005)(6916009)(82960400001)(66946007)(38100700002)(8936002)(186003)(66556008)(66476007)(6512007)(9686003)(316002)(6486002)(8676002)(5660300002)(2906002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGFISmkzdGhYN3F2Q0xnOExtTGF1ZlFROWladWd1TjAvSzlITExHTE93WURX?=
 =?utf-8?B?Mm9SRVNkYWZSVTl1bWVXSk5NR1JWWjBPbllTTGE5ODljU2VKRkdzNU9oakFk?=
 =?utf-8?B?MUY4RXE0YmNtR2JWVlhVbEhtTGpwcjdIWUlUSWF1S25KUFF2Qzg0YWZzWHdW?=
 =?utf-8?B?VHBpUHU2Qkh2SldBSmlqK1dPY0N2c1Bac2c4ZkxpZWdkUXFTVU5nOUpYRFJm?=
 =?utf-8?B?d1VSWWNIVVJaa0w0Ukt0Mm1lYlFCeEdHR3RsMjBzWDdsdlVIZkJMNmxMSWdM?=
 =?utf-8?B?aEJiMkhxZGhnSURvcm1MS0tzUTRWT2JucW1jR0ZUeStrWDNZeHYxYXVjZk9v?=
 =?utf-8?B?SzNtOEU1WWR2RXpZTzZjYk55Tkl1LzBwRnNWWmFxMFp1eEJKb1BXMmNsem52?=
 =?utf-8?B?ZlI1UU9IUXlyUGhOWVB0a25LclpCWVZ2dTlha3dnbGZWUHlYY3VsV3pkcklU?=
 =?utf-8?B?a3RaRzdPNG9CSnEyL0ZyOWZvUEZKZkJTTnJuamlCRytvbmYreCtqSFZKVEpy?=
 =?utf-8?B?ZnJZSjNhdncyWlUvMms3MUFubVdNNjhZSCs1VmlJclpPNExYUlFCb0ptbC8w?=
 =?utf-8?B?QWR6ejVKbVRNRFl5TkNCQmNna1FDWlpqbDNYS2FaZkNKUFd6d1diY2pxYnRP?=
 =?utf-8?B?SGVQWFcvUU1zUlh0T2tzZEIwanQzb2VhdEZBdHhlMjErQmFxU1ZYMDB4VFdC?=
 =?utf-8?B?bEhCSHBHVHMrUzV1WkVZWFNsRFF5Zm1iTHFHTXQrTDRsMzB1d3hPeEY2VWFy?=
 =?utf-8?B?a3pPZURMemhNZ1lZczRTTWZBR1BJOU1UdGJOK3Npdld5dXRJOC9CMXRuUW1D?=
 =?utf-8?B?eldTOHJZcWN5RjdoZlo5eWlRdFFZV2wwOUtkMVhCa2ZUYWNiT1RZTEVvVWpt?=
 =?utf-8?B?ZWg1R1IyUEw4Zk9NRHBaei9hblFXWmlvQlJyNU1CL0F0U3FzWVR4ZitZSGdW?=
 =?utf-8?B?V2xPN3hTK2RvWkpqMEdCQ0swU3BsdkQ2UzJPdnFQTjVDdmV6bWwwWFU5bXdy?=
 =?utf-8?B?MGxQWDB4OEZBNU5oYm16WjJtcElFYnpjV1poVTNjdE1xTGNtMksxckUvZGNI?=
 =?utf-8?B?bk11KzcxL0F0MGJocGVXR2FzU1JQdVNkMkF4RFFRQ3BTYm9SeTl1TEd0aHJL?=
 =?utf-8?B?cWNCM2l5cFBjZ3hHZEx5L1BBK0x1QlZycWRUUkU1NGtFeHhvZThJM1FCby9v?=
 =?utf-8?B?cXhmZ09xS3orR3pDNXVGVE1NNzJtVXlzQm5Qc2M1NDhObkZYdkZtd0pTSlhG?=
 =?utf-8?B?SlJkSVRHODRNblZoanBIQ21zTVczOGhyTlUxamRjWXR6TG9tMzlOeG5lUWVr?=
 =?utf-8?B?WVJUTkdSMGhObU51U0FXQU9UcW1KbHE1RlFkNXpoWkdFbXpWeFFXVDNJdytw?=
 =?utf-8?B?dHp4R00xL1dVS3JIV0RhakRZY096ZEVlVG1ZdW1nZk83R0czWUR3ZnBHcGJB?=
 =?utf-8?B?cGtvTVdhcDcrKzYyS0M5d3k2d3lKUmM1S3dydlBjRXVoTU5DY0liNGw3TnlZ?=
 =?utf-8?B?T29velZwUGhZMUFQSld5SWFSdnJTRlBXYnpXR3JnUW05M2dMa3VVWkR0ZDBO?=
 =?utf-8?B?RHVnOXVRK1hZb3llcFRXREJPRUwxeFVkODAxMmFHQzMzSWpxS2dQclNrSGkz?=
 =?utf-8?B?T04vc1lkeVY5SS9uU0pIeEI0RHY2YzJPVHNsZTRoZGNzU2lMczByd0xJT3pl?=
 =?utf-8?B?dnhKRGE4WmJIcHBqbDMzaVo3RXJxbUpOL3BoclIxY0oyUW9RKzk0a25UQUVu?=
 =?utf-8?B?SE5oMWRtc0psaHNsSFdSaWlrU3ZwSGcxak5rQzhFcjd4UjR5UjVHblBHOUFo?=
 =?utf-8?B?N2lWa01yYXlpMzFleVBBZGNtazYrakpNMXdaTFhEZWN0dldmYmMveGprK2Vm?=
 =?utf-8?B?NnZYRFQ0c1REd1VNR0ZVMUhINEM1a0diejhxRFFDOWlDajlpbE9wZDhhazYy?=
 =?utf-8?B?UTdlOHpxODdyOWNraXBDVDROcFhEUEFRYmRwTEUvV1hGcnllUmErbkFPK2lE?=
 =?utf-8?B?QXNMRFFWTGVRRWtIbjJrUXlpb2FuditTemJrN1hDOWhxTnRXREtLSjE3cFp4?=
 =?utf-8?B?N2ZzM0JHbVpKL3JqbkNBUDVJY09MZldQanRmSVJZSWdkN1lFNGJwVlkvcFdk?=
 =?utf-8?B?WldWYlZTcmVaaWRkQVRUUXpNV0Q1NWJmamZxWTI4OHNjUnQwWmZLM05kYUU5?=
 =?utf-8?Q?wu05RgJbhBeaRV1arKgN6pk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c393de3-1d61-4a80-98c9-08d9bf14e7b4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 15:17:55.9400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C3HKkw3J89YSf2SNnNq5KgEUffFzo4JNuRhF66jXXa/dQGEhqkgEAjvIBe9y93TesrOgqniiFhWhBZn4YOe/Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2490
X-OriginatorOrg: citrix.com

On Tue, Dec 14, 2021 at 04:10:28PM +0100, Jan Beulich wrote:
> On 14.12.2021 16:06, Roger Pau Monné wrote:
> > Forgot to comment.
> > 
> > On Fri, Sep 24, 2021 at 11:54:58AM +0200, Jan Beulich wrote:
> >> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> >> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> >> @@ -238,7 +238,7 @@ int amd_iommu_alloc_root(struct domain *
> >>  
> >>      if ( unlikely(!hd->arch.amd.root_table) )
> >>      {
> >> -        hd->arch.amd.root_table = iommu_alloc_pgtable(d);
> >> +        hd->arch.amd.root_table = iommu_alloc_pgtable(d, 0);
> > 
> > So root tables don't get markers setup...
> > 
> > 
> >>          if ( !hd->arch.amd.root_table )
> >>              return -ENOMEM;
> >>      }
> >> --- a/xen/drivers/passthrough/vtd/iommu.c
> >> +++ b/xen/drivers/passthrough/vtd/iommu.c
> >> @@ -297,7 +297,7 @@ static uint64_t addr_to_dma_page_maddr(s
> >>              goto out;
> >>  
> >>          pte_maddr = level;
> >> -        if ( !(pg = iommu_alloc_pgtable(domain)) )
> >> +        if ( !(pg = iommu_alloc_pgtable(domain, 0)) )
> > 
> > ...likewise here.
> 
> Yes. Plus quarantine domain's page tables also don't. Neither root
> tables nor quarantine domain's are ever eligible for re-coalescing,
> so there's no point having markers there.

Quarantine won't be coalesced anyway as the same mfn is repeated over
all the entries, so it will never be a suitable candidate for
coalescing?

Thanks, Roger.

