Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E37B467325
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 09:15:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237174.411334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt3i3-0003v6-VK; Fri, 03 Dec 2021 08:14:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237174.411334; Fri, 03 Dec 2021 08:14:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt3i3-0003sV-RS; Fri, 03 Dec 2021 08:14:23 +0000
Received: by outflank-mailman (input) for mailman id 237174;
 Fri, 03 Dec 2021 08:14:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wRzA=QU=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mt3i2-0003sP-0B
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 08:14:22 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 029d6530-5411-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 09:14:19 +0100 (CET)
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
X-Inumbo-ID: 029d6530-5411-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638519259;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=i87QEeii1EC1o3fP9Q5IGxKdrf13vNqO1UEfiItPbBc=;
  b=b4k344ymzck36Ap+YoBuu95wZmiNDNGoxTVLF55jTwzqIZhh+YivNVvz
   gwYBUFFY4PG0/3UdP7FmMki0Qi3G3hbrTuZfpJl68r/omjaQTFcdn/YRz
   Uaew0WVDxt+J4RUrN/Rac/QRb53uZiBlRrUxNMl7/5ELWiKnqtygle/nD
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: HneBJjHl/i6TCiZoOrqWPwkvFZk7xy8jxdLGR1WAUay1c2JuhjTfpDXNTnFR/agfE+ZBqmJcnP
 GIUmrf0fGlGnyWP/OdUulkie2Q6YRJo/fU+COzlS7tHjihM7tKLC8oj0UH5Z5bdZl29j4d9ltj
 epw66V4FO6TdnneZHXkK8Y2zkJu90Fu10+HXvdTIhX0KkdvvHmuQ+4q20Y07bEkSy8a8mOBGpu
 Lg+vxyhRY9NoHNHzDQouXpEb0eLo2tSGsvUjSrI5yPgiuunsbnptDvOineAOmH9/R4iRM/0Fml
 vYfZ+5rDuiLaQVgQRAw+1fjB
X-SBRS: 5.1
X-MesageID: 59577209
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:EQBE7q4sMmKUNC8Tgeu5HgxRtNHAchMFZxGqfqrLsTDasY5as4F+v
 jYZCGvXPqnca2v2f9wiOdvl9EpQvpLUyYVhTAs+/nw0Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdj2tQw2rBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z0
 cd9q56/RAQSMO7SlcsgTQN+DSx8FPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgWZt2Z8URae2i
 8wxex5hTgb5OgZ1GA1QC7tmtreFtF3TWmgNwL6SjfVuuDWCpOBr65DsL9j9atGMXd9SnEuTu
 iTB5WuRKg4eHMySz3yC6H3Eru3AhyTgQ6oJCaa1sPVthTW71mEVTREbS1a/if24kVKlHcJSL
 VQO/SgjprR081akJuQRRDXh/iTC5ERFHYMNTatqs2lh15Y4/S6AFFgaTDFMa+co99E7agE0z
 HmXktHAUGkHXKKudVqR8bKdrDWXMCcTLHMfaSJscTbp8+UPs6lo0EuRE48L/Lqdy4SsRGqum
 2ziQD0W3u1L1aY2O7OHEUcrat5GjrzAVUYL6wreRQpJBSspNdf+N+REBbU2hMuszbp1rHHd7
 BDoeODEtYji6K1hcgTWG43h+5nzuJ643MX02wIHInXY323FF4SfVY5R+ipiA0xiL9wJfzTkC
 GeK51gBuMALYyP0Nv4tC25UNyjM5fO7fTgCfqqLBuein7ArLFPXlM2QTRD4M5/RfLgEzvhkZ
 MbznTeEBncGE6V3pAdatM9GuYLHMhsWnDuJLbiilkzP+ePHOBa9FOdUWHPTP7tRxP7V/23oH
 yN3apLiJ+N3C7alPEE6MOc7cDg3EJTMLcys9pEMKLfcelEO9aNII6a5/I7NsrdNxsx9vuzJ4
 mu8Sglfzl/+jmfAMgKEdjZob7aHYHq1hStT0fUEMQn61n49T5yo6atDJZI7caN+rL5ozOJuT
 ulDcMKFW6wdRjPC8jUbTJ/8sI09K0j72VPQZ3KoMGolYpptZw3V4du4LAHhwzYDU3isvswkr
 rz+ig6CGcgfRx5vBdr9Ye60yw/jpmAUne9/BhOaItRadEj23pJtLij90q0+L80WcE2RzTqGz
 QeGRxwfoLCV8YMy9dDIg4GCrpuoTLQiThYLQTGD4O/vZyfA/2elzYtRa8qyfGjQBDHu5aGvR
 eRJ1PWgYvcJq0lH7thnGLFxwKNgu9a2/+1Gzh5pFWngZkiwDu8yOWGP2MRCu/EfxrJdvgfqC
 EuD9sMDZOeMMcLhVlUQOBAkfqKI0vRNwmve6vE8IUPb4i5r/eXYDRUObkfU0CENfqFoNI4Fw
 Ps6vJ9E4gOyvRMmL9Kag30G7G+LNHEBD/0qu5xy7FUHUeb3JoWuuaDhNxI=
IronPort-HdrOrdr: A9a23:fqP7QqsGQoiUm4eeaChiLgX77skC7IMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7EZniahILIFvAY0WKG+VPd8kLFh4xgPM
 tbAs1D4ZjLfCRHZKXBkXiF+rQbsaC6GcmT7I+0pRcdLnAbV0gj1XYANu/yKDwJeOAsP+teKH
 Pz3Lsim9L2Ek5nEfhTS0N1FdTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJqpmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O87isIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNXsHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa13ackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmP29yV0qp/VWH/ebcHEjaRny9Mw0/U42uondrdUlCvgslLJd1pAZFyHo/I6M0kd
 gsfJ4Y042mdfVmH56VMt1xNvdfOla9Mi4kD1jiVGgPNJt3c04l+KSHq4nc2omRCeg1Jd0J6d
 L8bG8=
X-IronPort-AV: E=Sophos;i="5.87,283,1631592000"; 
   d="scan'208";a="59577209"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GveR0qKhUPRTwyVWeyVwHCakhmwepgtuYKCbjsUw2JBkJihGtJPb3rfmJ8X9+1LswFTq2PQD8eawhaMd1JaxSwJxO7g/OZ3xSSc9vtUHDgW+emthoxyDgcOaBexvpQfTRzHmBNGX4f+LQEH6gRmLACME/f5nE/NzQKbKFuaWrIanb6JbIzpInv5Rl0wq69ggcqJTH1ZLN0LV+NXr2AE/5HxazxsenGcO8QiFgmCitZHulLA4bY3L+XB0zxqNp/U+IJwxGlfDOmYWXo1LuxO5YUrClUbkuUalMx+JP3/aKt4BbFHdyyHjhTRJ3EYBG0amC1TexvoDBUkMKuj3Rq//rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RMx1qjqyfji4cOHVe+tNycAJ87f9IqhiUbG6UWhSPvI=;
 b=BVGXtnhTnOp/8T0yf9X8FqyC62ZfjbWly5nSie3KOQlyn0pZ65nAh3RqRMPLdv6ZSDgC/llr3MWHGDTbCH2CK5quuhvDjVG7IVKtSElSr7sS1tyX0a1uJvYqhcFMeIZPkjywedOl6lonCCjGU1FVK1krzVlPv2euyLWV34KMh2d8DKcWglI40HC4304CQC2mlDeEU6m4d+9Xb0VXOdtKzXxU6nLmJdU5oRuSz8VSW/mdM7lzexvjYHIp5BakFQWDnFQb0hbJ+yjmO1AWPk1f56xa2e4CGQ9TYzGd6CM4E1awjV7xqDbIdJkNgkeOrzKpEXswPAYtIHsNzvBsMgWw7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMx1qjqyfji4cOHVe+tNycAJ87f9IqhiUbG6UWhSPvI=;
 b=RLXwYmCL2C+LNFp/lsnfB9qKhy8UzEEpsMqj3woa9ju0YFPCKtuvwBsO1iGcwaY9wKBvbnNLurEpkKIOex6q7QF2/4Kxu45R/53ALaaxyZcujq+E4+de9cTIWR8Kd5JQJCJiAVvZC6KMUB5bNm8XPoukOo0O/8jDNTeFEAHmY80=
Date: Fri, 3 Dec 2021 09:14:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] tools/libs/light: set video_mem for PVH guests
Message-ID: <YanR0IkNarIyoDA1@Air-de-Roger>
References: <20211203073058.10980-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211203073058.10980-1-jgross@suse.com>
X-ClientProxiedBy: MR1P264CA0117.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 256a51e8-1e7c-479f-cf4a-08d9b634e429
X-MS-TrafficTypeDiagnostic: DM5PR03MB2777:
X-Microsoft-Antispam-PRVS: <DM5PR03MB27770E4AB8A8D77B1C70CA2C8F6A9@DM5PR03MB2777.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CEol8k9tlkZw95o7l8AnFg1xtn6e+vxisoa1ODk8NROFKYFLpr7r29hQ8sMWlSDgWbSXV+RznV2MXg+4irUPyDhfhR9o7VI4zZz3xXPlMO1I7rLEIA5vhMvU2CanA6pPPL9hHDTaYU3uKGppIg3uBUV5CyZj8rhh6XoOpFZnEd1c2vzjXy6UJlwpjTtk2aOjS4wLGGSoBbCp+GZLnZdaO2AgY7RisHtQTRMGgFy0n1pJ4wKJ2ZPwE/4ieLMc6MC9psFLMd9MTFFPrQhMLIzGKmP4EMXhggGDTecuf1NRynYq7eRLB0ElxLRUTc9l3aDiLgHKn5Hmf233SJwYIRL8r7kv257i+cnSuodR5vbRqyt+W7IJJTyGgsnKqsi38SIdGffDQ7tvdWld/LOn3chab/opMXGjvbfhJWRQhKTChM7w27NPntF4OwotQd7gTDx5/lowCGVf3jXnp43QORTRwLVb0qsFzELreBQfL2U7e6W3mE3qOrQfmD6oxy0Tfw/o/sIEOYCk874gyoSJE/xb44mJzn8i11Cjcfab0ANHywdYnNl66BSIIucQCXO8kv9Ve7vQD4lBro4egHjdo4oOY+QjUEjy3/nzNt56hCYUQWQycELhTjgCxx99YNBa3JopyfU7ikIddZugQZX8twklkw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(6916009)(4744005)(54906003)(26005)(186003)(6496006)(4326008)(508600001)(5660300002)(8936002)(316002)(2906002)(956004)(82960400001)(6486002)(66476007)(85182001)(9686003)(8676002)(66946007)(86362001)(6666004)(38100700002)(107886003)(66556008)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjU0RjNYS3doK1lDMXExbXlpdisxbEhDY3pUWENFVkNlQlJyVkwxc1dtb0Vm?=
 =?utf-8?B?N3FCc080YmxvVjNIU0NHTDVMNzhETHZMQjAzS1RQUThaN1VGVmozeFNyTVBt?=
 =?utf-8?B?NThBQlJHM0l1amJBVzBhUWpPUTU1QmM0djNVVFJPN3d1VmgyUjc2QVNWYlgv?=
 =?utf-8?B?eENlekhQblpKM1lGbWxiTTVnWTBXS0xhMllPZ3NYdU1qYWsyVlhLWElKREdq?=
 =?utf-8?B?ZzVQQWZJRDJwNHVmUkxOaHNZdXZURHBwd2dPaFoyS3VYY002cUR2c3BPVWVz?=
 =?utf-8?B?dXFWMlFrZUlvYTcwSjArRU05TUNoU0orV2RBZDJaU1pTY3lHbTJNeS9FR0tU?=
 =?utf-8?B?SXd6MkswYU5oK05EbCsrZkdDVHRmbEpEbkpOcHVENDA3VVlHcHBmYkx3d21y?=
 =?utf-8?B?S2hoZ1pMdVhmOGJHTU5aT2xaTzIyK2VTdDVSb1Ywa3BzT1BaWlp2empTTFhy?=
 =?utf-8?B?YkJDOUdBUDRrd3dad0tWYU5JQ2dlN1QxdG9Fd0ppNWpnb1pjRGpLeUN6c2JO?=
 =?utf-8?B?dllnZGJPcjVwclloZEt3dkxNUStpNUpydjEyVXNWQnBZM3U3d3J5L2JQdit5?=
 =?utf-8?B?UThCam5oRWI1dFl4cHZsWU5JcVlSWWpuUkcweVRBWG9vQm1Jb1FsdDg3UldG?=
 =?utf-8?B?R3pGdUdjdk1FWk1KMHYrMVNJaGJ4Q1JiMm1YQ3R0Mit5SFU3WnI0TGh4cm1V?=
 =?utf-8?B?bFcvYkVDbGQ1NlZxV24zQ2VMT0lWZDQzTnhNck5kUmxpTlpNRHplY3JQY2dn?=
 =?utf-8?B?VUdUMVlScUVqWksxVUkzbXc5aHZySW94QXhSZzk5U0hEaFdMYWRTK3VTRU9x?=
 =?utf-8?B?VW5DRk95aHlnWTBrVnNUNStUdVNoSzJIU0dDbVMzQkQ0NVcvYVhVT2g4NjBy?=
 =?utf-8?B?NXpLK1M5dDlmU1FhY21wOGVlaHgxQytianZxckZTaGZXTjJySVNQRUQ5cFRB?=
 =?utf-8?B?bXpLN3R0d2ljeXpnVktxYVE1S1AxUzN4VWFpN3dFeHpVR0JCUDIvZmplNXBy?=
 =?utf-8?B?UC9YVGFWUU5PeWZSekNnOGJFT0xQYkhOS3Exd0lJSEk3eUF5YUhmL3M0elJo?=
 =?utf-8?B?YkhWMjQ0SnFPK2l6Z2RpNW41TWdkZldnajdOaUMxbi9RS0VGclFvV1gxZmtY?=
 =?utf-8?B?cTM3MFFTNnNiNEx3d0NlYUpHVEdienhiWERuck4ycFpRa0oyUnVuc0FabzRF?=
 =?utf-8?B?eHhUUktzSGJFMC90aDB5R051V0lnNk0vak1nL2FTeldGUGhmUVliT1h5VHdv?=
 =?utf-8?B?WXRjVEZ1RlVRanB6NjFNM0ZVT0JlWjltblprZ3lvSllrZDJtYjhZV0hpOGsz?=
 =?utf-8?B?UzU2MG5GQlZoT1hyTHZiWjU0UnpKcE9rd2NTZVVTV0t4UnZOdTFYcUxFQm1V?=
 =?utf-8?B?eWFXUzJHaXBZQlBTbVpmU0c4MjlHSlF4cEZTVVpSM1c3cTBURDYxLzlFSGp0?=
 =?utf-8?B?M2lZdjlqK2JkNHBYNkY5R041ZG9MenlwYklia1MxK2Jxek55RmhvTHR5OWh6?=
 =?utf-8?B?MlQrY2xYNmVYbzAxVVlrRjZKNGNIb25zVFVjeWtuQjlHNXFtUTdZU2g4d3Z2?=
 =?utf-8?B?VElFaUpNVWwyNmhaNVh1Q3Y4OTVFNjU2ZTRyRGZLOFVheUttOXlYbnJFaGhr?=
 =?utf-8?B?clN5bEVVNTBtWmRxY0h2S1BTOHREN1NxMUpQQzVtVkUrQVdmTW9ERWxMcFdB?=
 =?utf-8?B?TmRBOG1iT1cwNEwyeDczc21iaCtUd3QzZ1dnMmt4V0p0QkxvdkNoaUxPOTls?=
 =?utf-8?B?SDJkVEM4VTFhRWNJV0xCKzlkRjFwdDgvazhxYWxmTjc3dlc3R3JTTjhqc1NW?=
 =?utf-8?B?M002ajVNOTNJWUZOUkh4TTJZSWdOaHJuZnYyQ2tIS1FxMWFGcnJPR0NqbUhU?=
 =?utf-8?B?QWp5a3VSS3lUSFB0K0JxTWtQNGROSEpYWGIzbDE4WmQzcUQzWkROZzhuT0ZC?=
 =?utf-8?B?SGpDOGlPOFcxVy91ODhETnQ2Z3hYU0QwY1lIYlpuZTUwVU5ZNW0waS9MNnpP?=
 =?utf-8?B?eFF2ZC9ISUo2T1Z6UjBabnlmamw0VjExQW16WDlMR3JXYWFNc0h4SzNwVnl2?=
 =?utf-8?B?MDIxc0twS09qSDNwWFlOeUEvU1hRTVcvM3pnWFcyV0oxNGJ4RGlJbjVUWTVx?=
 =?utf-8?B?NWNZVXladE14R1dIMVJ5d3hUa3Jqam5EYnFwWEU0alZKRm9RdFBvMlNndnc5?=
 =?utf-8?Q?9kHE9Qyy5o5voSrkIE9ALeE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 256a51e8-1e7c-479f-cf4a-08d9b634e429
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 08:14:13.3479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /t+n7IgPjW4QsEup6xoSUUgcMzt88RtWaQO8HnJOLd3KueTHDJX1QaDMmGKIZ7hU8pUIc1FsB7cKQ4gbu38yMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2777
X-OriginatorOrg: citrix.com

On Fri, Dec 03, 2021 at 08:30:58AM +0100, Juergen Gross wrote:
> The size of the video memory of PVH guests should be set to 0 in case
> no value has been specified.
> 
> Doing not so will leave it to be -1, resulting in an additional 1 kB
> of RAM being advertised in the memory map (here the output of a PVH
> Mini-OS boot with 16 MB of RAM assigned):
> 
> Memory map:
> 000000000000-0000010003ff: RAM
> 0000feff8000-0000feffffff: Reserved
> 0000fc008000-0000fc00803f: ACPI
> 0000fc000000-0000fc000fff: ACPI
> 0000fc001000-0000fc007fff: ACPI
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

