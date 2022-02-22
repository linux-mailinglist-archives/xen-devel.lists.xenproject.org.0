Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBC84BFB71
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 16:00:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276814.473120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMWdB-0000bc-Cm; Tue, 22 Feb 2022 14:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276814.473120; Tue, 22 Feb 2022 14:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMWdB-0000Yo-94; Tue, 22 Feb 2022 14:59:09 +0000
Received: by outflank-mailman (input) for mailman id 276814;
 Tue, 22 Feb 2022 14:59:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YNC0=TF=citrix.com=prvs=045033034=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nMWd9-0000Yg-HG
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 14:59:07 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f884fc56-93ef-11ec-8539-5f4723681683;
 Tue, 22 Feb 2022 15:59:03 +0100 (CET)
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
X-Inumbo-ID: f884fc56-93ef-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645541944;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=SbeBTOi8zaaTys40RYF1aJeUs/XRONXLB321RxFIz9U=;
  b=VFd1G1fuQKFtAdCiESOcVprurdoKS/t/jGHh0kPD+FXmmR2/v4OI/NTk
   zIny4Eudq58SIFJ0sQhiPTJs/mYVC8IFF+FspKkw34rWugP89InkxNAvD
   poAkgbbRwP7mP2FDnZ7B9orIQI9PEMrYfNC3NsGdRljtwto7z9U0T98Ng
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=hardfail (body hash did not verify [final]) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64620795
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:c9AFo6g4Ndh6w5hq0vJHkdY2X161HxcKZh0ujC45NGQN5FlGYwSy9
 lOraxnFY6jUMyawOYxoOc7lxf41yZLdmoA1QARs/y1jHngT8ZrPD4zHdB2vYHnNf8OcFxI74
 84TNtKRd81tECaG9xvwO+Cx9SYj3PGGF+X2BeCZNngZqWOIMMsEoUsLd7kR3t446TTAPz6wh
 D/SnyH+EAergWJ/Pj5I4vLc8xky4K/7s28TtAYyP/0V7Q+PmSdIXc4Tfa2/ESD1E9JedgKYq
 0cv710bEkfxpUpF5gaNy+6jGqEyaueOe1DI0BK6YoD66vR4jnVaPp0TabxMOS+7tx3Tx4ork
 I8X78TqIesUFvakdNo1AkEw/x5WZcWqyJefSZRomZXOp6FuWyKEL8RGVCnaD6VBkgpEKTgmG
 cgjACIMdni+a9eem9pXfAXOavMLd6EHNKtH0p1pIKqw4fwOGfgvSI2SjTNUMatZammj0p8ya
 uJAAQeDYigsbDUIA04YVL0mht6oqVShXgEAsFiwvu04tj27IAxZiNABMfLQc92OA85UglyZt
 iTN+GGR7hMybYLFj2DfqzT127GJzXiTtIE6TdVU8tZFjVqJyWFVJAAQUVKjifK4llS/S5RUL
 El8Fi8G8/RsrhT0H4SVsxuQsFi57hkyXupqLsYi2Dyi5qqL+12zGT1RJtJGQIN/75JnLdAw7
 XeLgtfoCDpHoLCTD3WH+d+8vT60fCQYM2IGTSsFVhcepcnuppkpiRDCRcolF7S65vXqHRngz
 jbMqzIx750IltIC3ai/+VHBghqvq4LPQwpz4R/YNkqHxA5kYI+uZ6Sz9EPWq/1HKe6xUV6Do
 VAFndaf9+EECZyRlC2LT/4JFbvv7PGAWBXXhltqHoU9+i62026ue5hK5zNzL1svNdwLERfof
 037qQ5X/IVUPnahcelweY3ZNigx5fG+T5K/DKmSN4cQJMgqHOOawM1wTQmpxm+xv1A2qKEQF
 Mm2TZ60B1MBTqsymVJaWNwh+bMswyk/w0baSpb60wmr3NKiWZKFdVsWGADQN75ktctotC2Qq
 o8CbJXSl32zRcWjOnG/zGIFEbwdwZHX77jSotcfSOOMKxEO9IoJW66ImuNJl2CIcs1oegb0E
 pOVBxcwJLnX3ySvxeC2hpZLMuiHsXFX9y9TAMDUFQz0s0XPmK72hEvlS7M5fKM86MtoxuNuQ
 v8Odq2oW6oTF2iZqmlAN8Wk9OSOkShHYyrUZEJJhxBlIvZdq/HhoIe4LmMDCgFUZsZIiSfOi
 +L5jV6KKXbybw9jENzXeJqSI6CZ5hAgdBZJdxKQeLF7IRy0mKAzcnCZpqJncqkkdESYrhPHh
 ln+PPvtjbSUy2PD2IKS3v7sQkbAO7YWI3e26EGBs+7tbHGCpjDLLE0peL/gQA0xnVjcpc2KT
 e5U0+v9ILsAmlNLuJB7CLFl0eQ14N6HmlOQ5l4M8KnjB7hzNo5dHw==
IronPort-HdrOrdr: A9a23:Ee/9p638nuGQIfYsMiCh7gqjBGkkLtp133Aq2lEZdPUMSL3+qy
 iv9M516faGskd2ZJhAo6H7BEDuewK+yXcY2+Qs1PKZLW3bUQiTXfxfBOnZsl/d8kTFn4Y3v5
 uIMZIObeEYZmIVsS+O2mmF+qEboeVvnprFuQ+ApE0dMT2CIJsQljuRQjzranGe7jM2eqbROq
 DsnfZ6mw==
X-IronPort-AV: E=Sophos;i="5.88,387,1635220800"; 
   d="asc'?scan'208";a="64620795"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dX9GonJmCgrLORou+RDpQ8zLT6ctHaTDNhYEEeOcyPstDNRm+SCx8hr5o4lKgi+A56XNnDsCbgUU/+QpkSXbTs7n/dTOWVeCvzKH0Q5nHnxtpr5VcQ7lQeZCYBPhbIsNcl0PJhxURHScqWBCWnc9RJVwRL/KJQ2jAkBfvAbYPh39tJVTUYKVg7bz4nuZDRHtHcOn5wZmPn2kTgvXf3qwykOUvWLNELWbvt3Q3B+F50THNe/WzMYIhDGeUGykDeBW7LBxFVGimR5TxxhgoTm4PAbaFtd8ipVivkRk7APtJAXXJBnfnVlQM2MM084xL4EoX9VN8I1BMCQdbtnFeXzhJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bh+7nbr3vVoSl/lXmNsVSWw/L+iZ3INry1fsyem5orQ=;
 b=bJsutHcPUYPowQ3K3o24X/s9FfdBSVSvT650QEjQtbBq3icaMBwdRSwTf1btsVUQVh20hr0v9futCqUdarkHNXmWvSi07JmWHXmn6LLE+ncelV6Y2blyZDiLDvffjJ82xpHwykM66CVTqaSFTRZHHEb5R2HpT6jQ3YxrjM28oQmaeQkRHKFwWXIbpYovj5bOzA2Rfgz1ML8svViyFHiDRzsIEh6+1xO6f3QXQnU3W18vfgFCHeJEkuTDBcAzObkU9HiTUhwkGDbX0WpIR5NjPQf7GFQD0YUWjK4Mqr7ADdWHnFWHgiAylNRl+1lHMYAEQO4izLFSwP/TK2x5Kc24Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bh+7nbr3vVoSl/lXmNsVSWw/L+iZ3INry1fsyem5orQ=;
 b=jzwnNviNdNlPEaCs4GNYdFy0OjoOSprpVz3ZO8wTm/SBWQMuI/l5ahuwUnjkEcG2IR/0VSGNCveC6CAxwADBX2WVvkRlo/ueQpsdrwVuBNZoF79pH/G+hV4nnXZ0Bx1Bd5+QW2slJvV467UDqkbffD5eCwuYhT7Aeqgc51SrnWE=
From: George Dunlap <George.Dunlap@citrix.com>
To: Wojtek Porczyk <woju@invisiblethingslab.com>
CC: Jan Beulich <JBeulich@suse.com>, Ian Jackson <iwj@xenproject.org>,
	Committers <committers@xenproject.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] RFC: Version support policy
Thread-Topic: [PATCH] RFC: Version support policy
Thread-Index: AQHXkDev9/QrG+8IgUOEs2JU9EeShqt6ldOAgRojewCAC/K9gIAALOIA
Date: Tue, 22 Feb 2022 14:58:58 +0000
Message-ID: <77CD0734-A343-45CF-8A44-5C53771E404A@citrix.com>
References: <20210813113727.6028-1-iwj@xenproject.org>
 <de32c6c4-5ad5-862e-3988-0e7310ec3ecb@suse.com>
 <C6A7B444-4CFB-43A7-8FA8-AD1049F83912@citrix.com>
 <YhTUe7K5/rlek4AA@invisiblethingslab.com>
In-Reply-To: <YhTUe7K5/rlek4AA@invisiblethingslab.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 66ed190d-08ea-498f-566f-08d9f613db0b
x-ms-traffictypediagnostic: BN9PR03MB6172:EE_
x-microsoft-antispam-prvs: <BN9PR03MB61723BE4100485C5A73DD8C9993B9@BN9PR03MB6172.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QgD4gWIVc5Iio+OLE+XkldW/H047JxpVYojnO7GHU0J0HLahCLKA8v97Z+hfVPPaDRLSWUNtK4+MRmtdvEjTIGlwMXe6AK53N+PxTPy9qIJenyw7JWIdPnGmbP/czISzLYAtQHw+UKPP8+4aL30Jf2tJWXq6GTN5fpAbbhyga7aM+fy95ul+ZgZSptG2rnxpo2LXfT9gbnH7M5pRFneNPtkQrDtAriLcCLfPHEQFEOEw8jTMYTwNs1J8w6WpxeCYmF/hJJcv5V0rOCr0MYvk8IjdCek6NLHqstp0GphkymB/UrZyNfi78Wzqd7H4XaJJ+mjpSEgF7QmuL8xeuEnHEWa3mb8oLJbBr4oss3ftisWoGiy9FBgCNjZ0NE/ysUjNIowu1BsPfJJJgz5FjU+j7V+P6eodJ0tHKZIVVhzG3+IRnCfaGIBOO0DShGuUQOP6NZ9R5gRIRihzlHH6u7alD3nNAdinKl4YG8ewiX86LD282iiJmqnYyBebFhzCsKMHVybqQcw0pJ+9yaf2QMrNjUNdwEhyMzHfSNxujyrbTzKNQokOEE594GNIfGoS6gsKkmUVKByfRFS3iDKozVzcU/HnNFBSZHeeuRIMt9UpAXLLUlTDAGO01XbtAIle0EcKO2NH2Lu4DJQsFv1JyiTbhe6QvN+lM+0tmnbHPbqNQgRF7KTiwudv2q+MxioCCC2Vnokcb6FKxVKJ4yB2OcB1LBi7rg9Y7Ryda6zDaUMUGYnTjjAyK2VTIEs0KUlM4+/O
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(99936003)(38100700002)(82960400001)(2906002)(122000001)(38070700005)(5660300002)(8936002)(36756003)(6506007)(66446008)(4326008)(66556008)(66946007)(64756008)(508600001)(66476007)(8676002)(6486002)(91956017)(76116006)(54906003)(6916009)(26005)(71200400001)(33656002)(186003)(316002)(2616005)(6512007)(86362001)(53546011)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TWJiVW5JTFZzbUhhdzdJNm9yNWhmSnJkMXhlQ1g2Mk5KeUluaG9pRkc5dkhJ?=
 =?utf-8?B?anJXMXY0dFBUZ0lGYk5UT291VjZyQTMzamdKWU1uY3RxSlpadUxSRTVNWDh2?=
 =?utf-8?B?L0JpaG8zRmxPSnhTK2JKV1R4ODROL3dHQmtSMnJ5UG1qT0I1aGw1aUJSdHYx?=
 =?utf-8?B?V3BjNzV4MG84bFI0TzJvaURpd1pFZDk2eUZjcXl5ZGNzai80VXY1SGZFNmht?=
 =?utf-8?B?RXFHbFRUREtCUU9OTzFLL0tLc3hYYmRlYjhCYk9tVWNSbzZuQ2R2am5RNDM4?=
 =?utf-8?B?Q3FtZzNNRXRwQVFUTitrbGJGL2FmRUlDVWd3OTVTSWgyQVBjWWs5bnRuMUZ4?=
 =?utf-8?B?Y3dwNEpXamZZdHNUN2tlUGV5SitNMXQvZGVxOUFldjdlcEdMNFZ5TVplamU4?=
 =?utf-8?B?b21xY2VvcmtMVHp4YkVwZkFmN3ZBb2xuem8xSGMrWnFReWxndWh6clUrNTMx?=
 =?utf-8?B?aWFWOHU0dk0rVVBjU3owYlNzM0JMN2dlTEVYM3lrRERrQ3V4emwrVWR2dFFi?=
 =?utf-8?B?OEhkTjdmdUJmbHJJckdqMXhGb0NQTGRvRDBUYUUzdGMvYjhqMUttTlIya1Uz?=
 =?utf-8?B?UEFZR3RTR1lzOHJlM3NpMXdUa0dYZVNqbEFFT1JLcjBIMytkbkhkZThVM2FD?=
 =?utf-8?B?VlFaUHAwMUp1YWlFQWdvVFFCM3UwUHdXL3huNDQwWVpEU2RwWXJYanRIVWJu?=
 =?utf-8?B?Q0dGSWRjUkpUaitjQlZXaXZqWmVwWDRMTVFXVGZjTEVjQ1lUdjhVRmJ3eHI4?=
 =?utf-8?B?NVRCWHJKSDVEWHdVZm1rRENYbGlSdjJqd3NWUWtNNVBJVE1JTm0xQ2VWUlJo?=
 =?utf-8?B?eW5OVm1XNHJGUWtwdjdzV1pnZjNPc2ZPTndLRmFsVTBITzcrVllKRk1HNm1B?=
 =?utf-8?B?bCs4YW9qSEhrM2lhNjd4a2p6Q09nZlJldnBkTVh5Ym13Ukg2SThEcTR0NExW?=
 =?utf-8?B?QVBtdHVmVENZQnB0UFJPaXhMSENvUDZBYWdwNVVMRDlZMlB4Mmx0NzlML3V6?=
 =?utf-8?B?dVFNU1dodndTVnkxSTFWZWdUSXo0Q3puaEZrRU9OWHdBR3Q0TlVrVHBISjM2?=
 =?utf-8?B?M29zeU90WHY2WFpLeHNFTCs2bVhYejVaR3NNRDVYdUphcThOV1pZd0htTW5x?=
 =?utf-8?B?b2hsMDlKSHdqRzFUeis2dHczZngwZ2xhbEg1a3h3M1dMOTliNmtqcnBoenBE?=
 =?utf-8?B?RWV5MGtSWm5NWXMvYVlldEVpc2pXSVZ3ODF4MXpLWTR1MzNuTHhIdUd2OE1C?=
 =?utf-8?B?NHBjWnM4dmF0NWUyZGxCSmRDY212M1hobmpDazU0U1lEc1JnU2hvbzdFODVQ?=
 =?utf-8?B?VVpoMzBJbVhEdFBkZEsyU1NxdFh6YjNwdnVqeHEyeFpkajZLcVlzeDNTVk0w?=
 =?utf-8?B?dmlUbHdpN3YvMUNKWVB4bVpXek8rSWU5cVk2cUdUQlFXTmpwelVBNC8ybTZC?=
 =?utf-8?B?Zy9NUEpDTFB4RUw4cVExSEhqc3VqMHplS05Za3dWejgrb0hjYi8xN0dzTFZT?=
 =?utf-8?B?SHA2d2FXWkhXT2tMcXNudHlhU0IzWFZaSFdsNmg4YUp0UllVVmhOd2ZYckto?=
 =?utf-8?B?WlF2ZWVJMERkZlc2UXpFWXZoek55K3BDdHBMWnlJbE9MNG5GcXFaYlBmU3lz?=
 =?utf-8?B?SWZxb0tMT0RqT25WclQ5ck5OUE8yb2RwOExGd0tkT3FnbksyMm1iMXU0YW10?=
 =?utf-8?B?WlR6NFZMNHFOZGU3S1pGaEgrcDEvc3pkSjVORDl3WXdOSUo3OEF5VW9GdmEw?=
 =?utf-8?B?Y1pzRGtiRnpFdHgrVjhFM0w3WGw2SXMrRk5KYit2NENDbnYwVWw2cVJmbzJs?=
 =?utf-8?B?UUh0ajJkWGMzUHVDMVlEaU9aRUdZNWhpdTRRamZDQXJsZTZHakJSaHJpREQ4?=
 =?utf-8?B?Zmw3cnFUaHQ5b1ord29nbHNNUVBtZTdDTnhmcUI4aTlGK0UrS3dFMjF6Nnpk?=
 =?utf-8?B?N0NpYWg1N0FmanB6ZGpmNlhRREkvRGUvOHBDMzJqWW85alpOVTNhekxwU0tY?=
 =?utf-8?B?dDdKOXRCNHk4d0MxQmV3S0g1am1WSkRIUkpldWFFOXVxRFVpeE16TkxZaW5h?=
 =?utf-8?B?UjJjQnYwYnRCbHUybmNVeXMzUnVtQThTWkZ6RkRiOVFlZTJJSkdBSFVqVEF6?=
 =?utf-8?B?ZHRJSFFTYlcza2ZSVE5uelpwcmc5T2VNY01YTVdhZHhDN0lPUzA0NGVOSXM2?=
 =?utf-8?B?TXFubnFrZUo5bXFiTWM4OVduTVV1UUdYZENhVjRxSW5FOFduUy9kVitUa2JL?=
 =?utf-8?Q?ukkPMkJFPJjZ3xtUvCW2A83cZkAd25DpsAN9oG00B8=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A06E5F1B-5227-4CE9-905D-B5426099A5B7";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66ed190d-08ea-498f-566f-08d9f613db0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2022 14:58:58.8307
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pLJwjfXQ4EPy80mxVFsuREdUnN+9AKKLI0cJffUnoAOtPwN8cw3Cuyy9I0kAUI5s0D2xMjOBsGbxSM6Eg6kMn1z+3FCdHPVVgMiZsalrZd8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6172
X-OriginatorOrg: citrix.com

--Apple-Mail=_A06E5F1B-5227-4CE9-905D-B5426099A5B7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Feb 22, 2022, at 12:18 PM, Wojtek Porczyk =
<woju@invisiblethingslab.com> wrote:
>=20
> On Mon, Feb 14, 2022 at 09:50:25PM +0000, George Dunlap wrote:
>> I think it=E2=80=99s too much effort to ask developers to try to find =
the actual
>> minimum version of each individual dependency as things evolve.
>=20
> By "find the actual minimum version", do you mean to get to know the =
version
> number, or install that version on developer's machine?

Well suppose that a developer writes code that depends on an external =
library.  The external library on their own machine is 4.5; so they know =
that 4.5 works.  But will 4.4 work?  How about 4.0?  Or 3.9?  Or 2.2?  =
Maybe it works on 3.8+ and 2.13+, but not 2.0-2.12 or 3.0-3.7.

I don=E2=80=99t think it=E2=80=99s fair to ask people submitting patches =
to do the work of tracking down which exact versions actually work and =
which ones don=E2=80=99t actually work; particularly because...

> The second part very much depends on distro, but all of them have =
provisions
> to install older versions of packages, though not all of them might =
carry all
> the possible versions (i.e., it might be that you need version X, =
Distro A has
> had versions X-1 and X+1, but never packaged version X). Again, if =
this is
> a problem, it depends on the actual package and compatibility =
situation.

=E2=80=A6of things like this.

 -George

--Apple-Mail=_A06E5F1B-5227-4CE9-905D-B5426099A5B7
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmIU+iIACgkQshXHp8eE
G+3opggAs7aE+/IoOnjKhDxed/xNjPNO/ZwbLUh75a691PqpRNDYoXm0G3PeJW9k
Dtky70he5j+IhDv+1e76DjLsYT1tYSXrZpoDOG2VJ+ZerHWUEheO2lqxMZ0DRAxN
V8spUmFdRfuXiJdcsgID/0mDCLljGI7h1Tt8qd49aDOqhu1wzx2RxHUwid/syiNq
UuMtu2tZXlSApAEZoiSWamjF0rt5mwUqqEj9tgAsq3xc7R8aIhuAk3qQSTKwB+M/
qfgBnm6lb12ijOLd7kwxyPmYswkhagOlvnTuIlm0Jp+KYiVRSo0lasS1LH3XxOky
k5IH3Yr7AhCf57X/Qz8a/+UU7Wz21w==
=l2XJ
-----END PGP SIGNATURE-----

--Apple-Mail=_A06E5F1B-5227-4CE9-905D-B5426099A5B7--

