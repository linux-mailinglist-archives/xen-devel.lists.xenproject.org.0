Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 324424D3157
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 15:58:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287909.488216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRxlX-0001uI-95; Wed, 09 Mar 2022 14:58:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287909.488216; Wed, 09 Mar 2022 14:58:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRxlX-0001sO-50; Wed, 09 Mar 2022 14:58:15 +0000
Received: by outflank-mailman (input) for mailman id 287909;
 Wed, 09 Mar 2022 14:58:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d6dl=TU=citrix.com=prvs=060aafcb7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nRxlV-0001sH-EB
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 14:58:13 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55ddf408-9fb9-11ec-8539-5f4723681683;
 Wed, 09 Mar 2022 15:58:11 +0100 (CET)
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
X-Inumbo-ID: 55ddf408-9fb9-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646837891;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=e7+AyKssidMZLDWEY6cz/4eglHEFeDKP/Lmw/ANVxT8=;
  b=ammBohj3zkKQnsmcDhpc2o68LRsph5fXWZRNj5SvMxUhuSRcTMzBj12o
   JEkgnzQQ4cRfza9FC57IBoZaSDqEaj5w0hxrBww6B7DpiqcjwIHhcdZVN
   BMtcKNcTO+hG6NMSN2qbJLhy1ojx389X1Ex39dTTPmbt+PA2rgabdQrzX
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65298670
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+1T4aKBuGbX5AxVW/6Xjw5YqxClBgxIJ4kV8jS/XYbTApDIm1WZRy
 2IaXjrXPPyPZmLyfdx+aYTi/R9T6MLVxtVnQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vh09Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgy5
 e9L5b6BVTx0O5SP39QncEJzC35xaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4TR6eOO
 ZVBAdZpRDr7bRpjPGcoNKgnt8uIukjvdQUB+WvA8MLb5ECMlVcsgdABKuH9cNGQWd9cmEreo
 2vc5nn4GTkTLtnZwj2AmlqzgsffkCW9X5gdfJW6+eRjhFm7z2kaGhoQE1C8pJGRtEm6XN5OL
 l0OzQAnp6My6U+DQ8H0Wluzp3vslhwWVsdUEuY6wBqQ0aeS6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hSipJSEfIGsGZCkFZQgI+d/upMc0lB2nZtR+FK+4iPXlFDe2x
 CqFxBXSnJ1K05RNjf/iuwma3XT8/fAlUzLZ+C2Uc1ijviFIeLX4YrXrrmjhzq1rNNmWGwzpU
 Gc/p+CS6+UHDJeonSOLQfkQELzB28tpIAEwknY0QcB/qm3FF2qLONkJvWogfBsB3tMsJGexC
 HI/rz+983O60JGCSaZsK7y8BM0xpUQLPYS0D6uEBjaij3UYSeNmwM2MTRPIt4wOuBJ1+U3aB
 Xt9WZzyZZr9If47pAdav89HjdcWKtkWnAs/v6zTwRW9yqa5b3WIU7oDO1bmRrlnsP3b/lmPo
 4oDa5XiJ/BjvAvWOHm/HWk7dwxiEJTGLcqu95w/mhCreWKK513N+9eOmOh8KuSJboxel/vS/
 2HVZ6Or4AGXuJEzEi3TMioLQOq2Bf5X9CtnVQRxbQfA8yVyOu6HsfZAH6bbiJF6rYSPO9YvF
 KJbEyhBa9wSIgn6F8M1NsCs8tY9KEz12Wpj/UONOVACQnKpfCSQkvfMdQrz7igeSC2xsMo1u
 bq70Q3HB5EEQmxf4Az+M5pDE3vZUaAhpd9P
IronPort-HdrOrdr: A9a23:WGVpha3PvfR3NC7rRHxgvAqjBRxyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5AEtQ5OxpOMG7MBbhHQYc2/hfAV7QZnibhILOFvAt0WKC+UytJ8SazIBgPM
 hbAtFD4bHLfDtHZIPBkXOF+rUbsZi6GcKT9J/jJh5WJGkAAcAB0+46MHfhLqQffngcOXNTLu
 v52iMznUvHRZ1hVLXdOpBqZZmgm/T70LbdJTIWDR8u7weDyRmy7qThLhSe1hACFxtS3LYL6w
 H+4kzEz5Tml8v+5g7X1mfV4ZgTssDm0MF/CMuFjdVQAinwizyveJ9qV9S5zXMISaCUmRQXee
 v30lMd1vdImjTsl6aO0F3QMjzboXMTArnZuAalaDXY0JTErXkBerV8bMpiA2XkAgwbzYtBOe
 twrhKkX9A8N2KwoA3to9fPTB1kjUyyvD4rlvMSlWVWVc8EZKZWtpF3xjIfLH4sJlOy1GkcKp
 gnMCgc3ocjTXqKK3TC+mV/yt2lWXo+Wh+AX0gZo8SQlzxbhmpwwUcUzNEW2i5ozuNxd7BUo+
 Dfdqh4nrBHScEbKap7GecaWMOyTmjAWwjFPm6eKUnuUKsHJ3XOoZjq56hd3pDhRLUYiJ8p3J
 jRWlJRsmA/P0roFM2VxZVOtgvARW2sNA6dvP22J6IJzYEUaICbQxFrEmpe4PdIi89vd/HmZw
 ==
X-IronPort-AV: E=Sophos;i="5.90,167,1643691600"; 
   d="scan'208";a="65298670"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IvkOWfKUVFZOxFm2IYt43anls8jabEXaf5iPxEm/UxE64aTHOGhO9yy3xaSKdyEEqhDVxKiT/Qx4XPyT/H8kquRPC3JsnJEgFa6XJQ2rSVLtBnvaOv2vV3URHvB8XqNNzF9IIpboXT+c4yQ0nkMtxAzZCJHh7J/G7imFY2J37zy13g2VNejMO4t4KAxKHfcE873gV0MjAj+KU9BP7/9i4KShGibjeiK51/ytuRZNwdF+nHlGtS6CqTeZhZFy9ac8nQ2U1s4GKxEnUfF/SzCFL5WS060ghVux89b28LHar3tO/SzsK6RZw4GKDOsjhTTWEwfCDxBg4AUpN9a89iv40Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7+AyKssidMZLDWEY6cz/4eglHEFeDKP/Lmw/ANVxT8=;
 b=l3X9apjkQ3oFG72fDesEg65rlpDWMe4S+g0YGALEuzXABvx7N25jh6FhIsUuMAwaWZ7CYsUPr/ENYCOUCLpgsr5e96CAWVvdleLL2XGITIFpHvTgq5zeBy/4pdifEDNYeEYwCt9VBZef3HwyN2+Y76M+0hTPaMhvWCyOoBW2bP3NgKlYgLZ76IJZXaqJS1CUEGY2Nc8wmsoTyKUSmcqnInCH6aYzonqzny9iC0t2HclfWO8QzSSJZUmPHkgputHY4QlCyg6meUuk6fNG87S99MsnPIhri+eDf4uqT2yxAbgKRgmi9d/uAY4GWIVwgia3R50766SZjiUHVtd41JgxYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7+AyKssidMZLDWEY6cz/4eglHEFeDKP/Lmw/ANVxT8=;
 b=hnl4UTvqlY+BEeuygQkf/tMvSE+xX/Qd6U32ew1G+tw0BcrwR4M5g61ZKs5Ha54eRZ48bNEq6L/Due6bY6q4bi3ygJMMoyRyono3YBv3eErLbVG8a3vBV+ERGHRhkEG3EkljDOjsaOSRz4k2TdK70uK3Cu9/uG70PPGcFVW3+o8=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v4 2/2] livepatch: set -f{function,data}-sections compiler
 option
Thread-Topic: [PATCH v4 2/2] livepatch: set -f{function,data}-sections
 compiler option
Thread-Index: AQHYM7F5J3x9C8ot2EWO/SfgpDadpqy3JMcA
Date: Wed, 9 Mar 2022 14:58:06 +0000
Message-ID: <48528d19-d6ab-d8ae-498c-091b5b719250@citrix.com>
References: <20220309122846.89696-1-roger.pau@citrix.com>
 <20220309122846.89696-3-roger.pau@citrix.com>
In-Reply-To: <20220309122846.89696-3-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 544baed5-5eb4-4de1-a155-08da01dd3817
x-ms-traffictypediagnostic: DM4PR03MB6191:EE_
x-microsoft-antispam-prvs: <DM4PR03MB6191D12B60D8E4EB358CCFBDBA0A9@DM4PR03MB6191.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EVnaTB71yEr3IDPG3H3BZeilZOnKnAktyQ7m10Iqf1SoL3F31SXHRpkoW1Le2RUdB70V1N01epol0HmVDyutlKMOqNxjf4fL78HDUXqorxJRVDcj0Y8sviWxnfAnFkOD0wpsKSAcK7xj7vFUrlU/WqULHZVGSp0Jqi8Y+hFaBgcBJeTSFIzCVykocmYsIZnE285MH8NpKsZFy5l1IEmeTC2wa0L/EMKAoj7vvPxzKuBkG7p5/PPRcU2e8R3gBgi6RR/BXR9kgoJ8UEHZKvVMlADLdiCFyi8upItIjLx5B1MFOGva2xm0JgPMD3pvjFha2cb0HyNOO+NvbHe9yQvUKSBb2bSfs+kZCCsMX0rTvph42biRZtzwxveIkAxyOQLJI9WtSnyQDr8rMt1o7eLXxmz5apVwtNGoUN8q3ggKYrPR7Qp7ErrgBtYNLkpuHkPx3eWUroeEs1rlDj4QoVyTN1X/voPLzRLjMLmE/4p76QSVhcVjvkEY2rjvrPWd0f2ciwFZmPY+sBgpmoD5KCNafUmGx89s1IRaviNjOhBXjCZnVUSBYY3xEYemaRBrLGj3ImZygz5QIwnHoLjEDXaWXxcbwC/Z7UN0hhFvk+jTlDnqrQyPhBCULdA/exhd24cuaSWq9AS+yg3IoXk3EgL9gE2Dgr/mhc5F6PmKq7Uc2vislSvWtPEi5almYYC5PZb8Zhz2/fBovId569AJTWNuQDtlVqUtNW+O7+M5NKiDjpON0rPHkeQheBbBPP6JPUxEa6HuU88dIsYj1Rl8E6dwCw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(66446008)(53546011)(6506007)(86362001)(8936002)(83380400001)(5660300002)(4744005)(6486002)(6512007)(76116006)(2906002)(186003)(26005)(4326008)(66476007)(64756008)(31696002)(8676002)(91956017)(66556008)(2616005)(38070700005)(38100700002)(110136005)(122000001)(82960400001)(31686004)(316002)(71200400001)(54906003)(36756003)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N282Z2hWOVF0eFZrbmVMRnI2TmZHNlQ3d21XaGZSZFFHRUwzRWlsNUtDTDNM?=
 =?utf-8?B?aHgwNDVENS9Gc3lVMkhvSVJ3M200bGt2NUV6WFptN0w2NER5OUJ4NWdIZU4r?=
 =?utf-8?B?a0U3bW5RcUI2MEs3SnZKSjBJWER2UmMzYlV0aXN2NVhPOWs2WXlxY21TU3hT?=
 =?utf-8?B?Smc2Q0lndng0ZmdCWE1uenZYNksrQTFVMUZNWkxna1ZKL2d2eXpVa2p4WUMz?=
 =?utf-8?B?U2pWTDdwc0RuRmZROE13eEt5bCtkMVp2anBrNTZCa1JRaHVKUTNSYVZVSWE0?=
 =?utf-8?B?S1hPMXFGbVpMZVVVdTc5cG45Uk0rMy9JTnIwUXZSSi9jR1NHcmdhbndBdzBW?=
 =?utf-8?B?clFqUmY0ZHlaRmdkRWZxc05BVllsTEVxNDJrMy9BWjhaM0pZRVY4NExiRm51?=
 =?utf-8?B?bFNlTE5yeTgrZ3g1VmN6QWY5c0svNlZrb083NXgrVjh6cTNhLzcxSXJwb0pj?=
 =?utf-8?B?YzMweTdQK1hWNkpQRGFTNTIvZmlBbnRnWnZtaGFPbnhkbzhWZmNMbmF2U2x0?=
 =?utf-8?B?Vy9QSWQ4M0djVUJuTkF5SmhhOHZkK3BCVmxINEtHVGNka1EvV3dVL0l3a0pY?=
 =?utf-8?B?bndtYTdVSlFyWnJoUW9ZZUdYSnV3Vjh5Y1RrR2Nwb3FQTnhwVWF1bjNHb0l4?=
 =?utf-8?B?cWYwNXhwbkZub2J3V2ZUR3V6VGE4VnN2WGJEQnFleG05Rm9wa29WS1VPMlBB?=
 =?utf-8?B?M1RuZlFuKzlpcXZzbHdFcXRjOVZmekhIYVovamF6S3hRbENJVFFkcnFWNDBU?=
 =?utf-8?B?ZjNJZkpiRGtHVm5hTlY5am1WMVpUQjI4RkNSaHpEbTUwdVFDZEFaTFVwK3RF?=
 =?utf-8?B?cUxRWFcwZXRTcWFBYlZibVMzVmJyeXI4N3plQmpmWUhZeGpYVElIVDhMUWRE?=
 =?utf-8?B?MkRNZ0lrZUt1Zk1jYmRNaDNTV2VXR01pNE84dEFXekNPS3F4aC9Xcm9nV3Rj?=
 =?utf-8?B?T0xwbjRub04rb3Z2eU5UMEhMQ3kwOXFac2psOTU0bnBjTnB5L0lSZGlUVENJ?=
 =?utf-8?B?OWdrWkxWbENPM2J6cjcxb2ZwUU12MDV1M3dMd1FWMXZVQXplb3VDc3JHYUVJ?=
 =?utf-8?B?ZlRZOE85RjZXaFpuc1RxK3hMdjY5N3ZXL1JBUS8wREsreFdmUzcva1hiMDUv?=
 =?utf-8?B?NzB6UnMwUkJBamtrbTRvbkhqak5EUWJuSjNaS04rWG5sbWR6UVhhalY4aWdq?=
 =?utf-8?B?UzVNNlRFRWxJYXRobU54a0kxZWE3NXNIK0pGd05LZXBGL2RUNjdiUFBNMnJk?=
 =?utf-8?B?a01HUkhwNjdwYlRtRGtXNWdwaHZ1cnB0R1UrV2xZTmI0WlBIZkZ6QzJTN1E3?=
 =?utf-8?B?S2hrYkJ0Y3NSOXJEWU1EYmdXQmo0SFBQa2h6aDRIWlUwanBzMGJCN3ZYS3Nz?=
 =?utf-8?B?WVBhZ0pLb0lXN0RkNTZxbUQ1V2o4dTY1QkU5UTFDSjBHTkFDeE9mWEc4YTNW?=
 =?utf-8?B?Tm5RenkyWjJrTGFEV0I3WXpBUnY4UXJJTnNJNUNJN0NzdzJYMVZOYTZvUEtj?=
 =?utf-8?B?SndzTzUycnZwYjlHRzEyTGI0c0MwS0VTTE5tQjNxa3JRV0dRV2ZIZjM5bWNG?=
 =?utf-8?B?QUZOb1Q0blRVZlpVbFYrRWhEMnlrRmNkNTlRY2p0Vm8yelBzUFV6clRHRkFz?=
 =?utf-8?B?MWNxN1czVm9YQlRLREpkakI5QytwTUo4akF6dzdTTDhBRGF4Y0JUV2kyNkpk?=
 =?utf-8?B?c2c3MWhQa0Y5bDVIUUtOa1FuSXlxMmw0b0UrTkFIZ2lrbFhsQWNzeDdUc3Bo?=
 =?utf-8?B?NVNPbytwWlRENjZsN0d0ZHRnS296QmpTUkVzbnhQUjFsOW0wR2UxQ0RocTdR?=
 =?utf-8?B?ZVgxVlNRWERlUEJKVEZhNDNLbkZhL05hUlp4dmoyczBMUmZ0eThRbEp6Y3ZE?=
 =?utf-8?B?cnhUT1ArY0U0TkIzRmNJVzM4R2RwL0c3UXk0MmhUc1I5VDE4U21pQzhXcTg3?=
 =?utf-8?B?cEo2dWJuZEx2TkVNRjh3UWJRbHc2V1U2TzFEekpmd3ZsS25jQkVNMTk1TXNi?=
 =?utf-8?B?YVEvNTViOXJPeUkrZ3ZhY2tGUW9wa1ZBK0tqaE1JZmJ2eGllVE9EbzEzRmxL?=
 =?utf-8?B?TExHMEk0RWZMUnQ0NVp5UmpvNkhMQU5NL3A5aG1MRXJ2V3cyU3JlRFZ3TURm?=
 =?utf-8?B?Q1ZOaUVEWW54NUZBRDYvODJFSlA1cm1kSjhVYldBVllZMDExVVd3ZmVqckFX?=
 =?utf-8?B?dUVRTVV2c2lIWWljQ2Rob0RZRUQ0a2NGZ2dnMUx2dVRSdkg0YjNzZUdpaXAv?=
 =?utf-8?B?aTdlZ1FHTzcyM1NtZ04rL1NYSDZRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1BE9BF75B2045040A9433921EC86D4A1@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 544baed5-5eb4-4de1-a155-08da01dd3817
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2022 14:58:06.6038
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vCfn6b3yqLhPQb4wGwk7UHIyMsChpgiekwkp1nrVS1xM9E+CQhCHYfPId9Mbo3ZqmBMpQryZqK8D7iE3QsGAYE2aQN+2tA982u2cVwV80ko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6191
X-OriginatorOrg: citrix.com

T24gMDkvMDMvMjAyMiAxMjoyOCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L3hlbi5sZHMuUyBiL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMNCj4gaW5k
ZXggOTYwYzUxZWI0Yy4uNDEwMzc2M2Y2MyAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L3hl
bi5sZHMuUw0KPiArKysgYi94ZW4vYXJjaC94ODYveGVuLmxkcy5TDQo+IEBAIC04Nyw5ICs4Nywx
MiBAQCBTRUNUSU9OUw0KPiAgICAgICAgICooLnRleHQuY29sZCkNCj4gICAgICAgICAqKC50ZXh0
LnVubGlrZWx5IC50ZXh0LipfdW5saWtlbHkgLnRleHQudW5saWtlbHkuKikNCj4gIA0KPiArICAg
ICAgICooLnRleHQucGFnZV9hbGlnbmVkKQ0KPiAgICAgICAgICooLnRleHQpDQo+ICsjaWZkZWYg
Q09ORklHX0NDX1NQTElUX1NFQ1RJT05TDQo+ICsgICAgICAgKigudGV4dC4qKQ0KPiArI2VuZGlm
DQo+ICAgICAgICAgKigudGV4dC5fX3g4Nl9pbmRpcmVjdF90aHVua18qKQ0KPiAtICAgICAgICoo
LnRleHQucGFnZV9hbGlnbmVkKQ0KPiAgDQo+ICAgICAgICAgKiguZml4dXApDQo+ICAgICAgICAg
KiguZ251Lndhcm5pbmcpDQo+IEBAIC0yOTIsOSArMjk1LDcgQEAgU0VDVElPTlMNCj4gIA0KPiAg
ICBERUNMX1NFQ1RJT04oLmRhdGEpIHsNCj4gICAgICAgICAqKC5kYXRhLnBhZ2VfYWxpZ25lZCkN
Cj4gLSAgICAgICAqKC5kYXRhKQ0KPiAtICAgICAgICooLmRhdGEucmVsKQ0KPiAtICAgICAgICoo
LmRhdGEucmVsLiopDQo+ICsgICAgICAgKiguZGF0YSAuZGF0YS4qKQ0KPiAgICB9IFBIRFIodGV4
dCkNCj4gIA0KPiAgICBERUNMX1NFQ1RJT04oLmJzcykgew0KPiBAQCAtMzA5LDcgKzMxMCw3IEBA
IFNFQ1RJT05TDQo+ICAgICAgICAgKiguYnNzLnBlcmNwdS5yZWFkX21vc3RseSkNCj4gICAgICAg
ICAuID0gQUxJR04oU01QX0NBQ0hFX0JZVEVTKTsNCj4gICAgICAgICBfX3Blcl9jcHVfZGF0YV9l
bmQgPSAuOw0KPiAtICAgICAgICooLmJzcykNCj4gKyAgICAgICAqKC5ic3MgLmJzcy4qKQ0KDQpT
b3JyeSBpZiBJJ3ZlIG1pc3NlZCBpdCBlbHNld2hlcmUsIGJ1dCB3aHkgYXJlIC5kYXRhLiogYW5k
IC5ic3MuKg0KdW5ndWFyZGVkLCBidXQgLnRleHQuKiB1bmRlciBpZmRlZiA/DQoNClN1cmVseSB0
aGV5IHNob3VsZCBoYXZlIHRoZSBzYW1lIGRpc3Bvc2l0aW9uPw0KDQp+QW5kcmV3DQo=

