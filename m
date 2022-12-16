Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C33F164F1C6
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 20:25:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465003.723568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6GKQ-0003ii-SS; Fri, 16 Dec 2022 19:25:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465003.723568; Fri, 16 Dec 2022 19:25:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6GKQ-0003fj-P4; Fri, 16 Dec 2022 19:25:06 +0000
Received: by outflank-mailman (input) for mailman id 465003;
 Fri, 16 Dec 2022 19:25:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Zr/=4O=citrix.com=prvs=342bb51ac=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p6GKP-0003V4-DV
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 19:25:05 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55202481-7d77-11ed-91b6-6bf2151ebd3b;
 Fri, 16 Dec 2022 20:25:03 +0100 (CET)
Received: from mail-co1nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Dec 2022 14:24:57 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6956.namprd03.prod.outlook.com (2603:10b6:510:173::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Fri, 16 Dec
 2022 19:24:55 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.019; Fri, 16 Dec 2022
 19:24:55 +0000
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
X-Inumbo-ID: 55202481-7d77-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671218703;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=2zZDXiGexGiO4rjouJfy7iVvJzriAj1YhvUadpBkcqQ=;
  b=ac3TUQnEe/jQLMr7LwlMQEV+Lg28kCd/qr88nDaNWFQxHWe6RbXdy8yV
   MaRt3dtVk3I8jQLO650UaD0+wnt/So04qZtEq3jo5NzMKfGPsKiMxcR4N
   ctKyjnJeUjaxl7jRIsUZjROZAEj5BRj+TZE3vjoAeXqBOCJN+ke6AVzUZ
   c=;
X-IronPort-RemoteIP: 104.47.56.170
X-IronPort-MID: 88319517
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2zTxLauN8CgRzBTFc50ZARox3OfnVHRfMUV32f8akzHdYApBsoF/q
 tZmKWiOa/3eMGrxfth/Oo+y904D75/VnYJiQFNqqCs9ESob+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoR5QWHySFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwdgg1Ug28g+yK3vG2ZeZdv5k9fPu2FdZK0p1g5Wmx4fcOZ7nmGvyPzvgBmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjv60b4K9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPO3orac73QTMroAVIFpNUgWDs8vjsBSVAc0AO
 n4/xSMep6dnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8sjeaKSUTa2gYakc5oRAt5tDipMQ4iUvJR9M6Saqt1ISqQXf33
 iyAqzU4i/MLl8kX2q6n/FfBxTWxupzOSQ1z7QLSNo640j5EiEeeT9TAwTDmATxodu51knHpU
 KA4pvWj
IronPort-HdrOrdr: A9a23:nLjs9a3tupbswqCM5loN5gqjBRV3eYIsimQD101hICG9Lfb45q
 Xe4sjzhCWb+VRhJ03Ix+ruScrwPU80raQFq7X4Pd+ZLX3bURiTXcxfBOrZsmDd8kjFh59gPM
 hbAuBD4bHLfCpHZKXBkVWF+rQbsZK6GcmT7I+0owYIPGYaEtAZnnwJcHfnYz0GNzWqHaBJcq
 Z1UKd8zQZJgxwsDviTPXUeU+/f4/nGjojvbxJDJxNP0mSzZFiTmcnH+m2jr14jukR0sMEfGA
 b+4nnEz5TmntSD9wTd2WHe9P1t6encI+94dZyxYqh8EES+tu/kXvVNZ1VM1ApF+N1Grz0R4f
 DxiiZlG/42x2Laf2mzrxeo8w780Aw243un7VODm3PsreHwWTp/LdFAi4Jfeh6csiMbzYtB+Z
 MO+1jcm4tcDBvGkii4z9/UVytynk7xhXY5i+Ycg1FWTINbTqRQo4wZ9EYQOpYdGyDR7pwhDY
 BVfZrhzccTVWnfQ2HSv2FpztDpdnMvHi2eSkxHgcCR2yg+pgE/86O1rPZvtksoxdYYcd1p9u
 7EOqNnmPVlVckNd5tnCOMAW8esTkTLXBLXKWqXZW7sHKYsPXXRp4/riY9F2d2CSdgt9t8fiZ
 7BWFRXuSoZYET1E/SU0JlK6BzWBE2gQDXE0KhllqNEk4y5YICuHTyISVgoncflie4YGNfjQP
 q2OIhbGbvKMXbuI4BUxAfzMqMiEUU2YYkwgJIWSliOqsXEJsnBrerAas/JKL7sCzo/HkviH3
 0tWiPsLN5M4k3DYA7DvDHhH1fWPmDv95N5F6bXu8IJzpIWD5ZBtggOhU78x8GQNDtYosUNDX
 VDCYKitpn+iXi9/G7O4WksEAFaFFxt+7nlU2lHv0stKEP7cbEKvv+beWxUwVu/DhJzVM/NCm
 dk1nNK0JPyC6bV6TEpCtqhPG7fpWAUvmiyVJsZmreO/4PdYZUzAow9VKE0PhWONBpoggFjrW
 dFZmY/N3DiPwKrrZ/goI0fBenZedU5qhysO9Rssn7atV+Rv4UUbF5zZU+TbeenxSIVAxZEjF
 x49KESxJCanyy0EHAyhOQjPEcJVX+eB6heCh+ZWZ5dlb/qcjttRlqbnDDysWALRkPas2Epwk
 DxJyydfv/GRnBHvGpD673n9FNven/YQll5bWpit5ZhKH/PtXly29Kaf6bb6Rq2VnIyhsUmdB
 3VazobJQ1jg/qt0gSOpTqEHXI6gr0zI+30Ft0YApPu80LoDLfNubANHvdS8pogHsvpqPU3Xe
 WWfBLQBC/kCtkuxxeeqh8eSQpJQUEf4NbVMSDenUiFNT8EcNvvyW1dNp8my5f21Rmwex7OuK
 8Joe7c8ICLQzfMg5C9uP6nSwKq7Hvo0DqLpqoT2NxpVJkJxfhO90Oya0qf6Jh25mRoEC69rj
 JQfE1a2sHrBmY9Rb05R8qulmBZzehm2yMQw0rL60UFDGAQZjngTvy0youNkKEoBEKZogv2JB
 2wzw1xls21bxer5PoiEKQ3Ln1RaE8grFJY3M3HWbHxJWyRBtJ+FHzTCA7tAYtgoWy+aOtgmy
 qSTOv42tO/Zm79wkTdrDF7KqVB/yKsSca/Bw+FAqpT/8e7NU7Jgqyx/ca1hjuySTbTUTVYuW
 VvHXZgIPirSgNSyLEfw2y3UOj6s0glm1xR7XV6jFL33oCn5WzcDAVcNxHFgpJZVTdeNWXNlN
 /C++SDznjxiQI1m6UrPH0gPu1zJw==
X-IronPort-AV: E=Sophos;i="5.96,251,1665460800"; 
   d="scan'208";a="88319517"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VsraaAv2HimShC1n8L/KOcbiKtmwTwkH/5PDw+EYbAtjMaYLHaKv8LfuTi4t7fWCHO8zB4cnoUQfUdRZjFE70/ZXX964rx8HewXdEUsLzz+w98w4W8PTVxt9vjS7p3xeGoushYoXga1B0BvQrePyxG0faCBewjl9UbJPraBkjosfoTNeJfS1OxJumSFtele4CUGroB0wQCtrP6RHmzBhjbS56qjt4JFMrRfDqLtrUIoSaZWR0S1fOz3K6yEq3EOm/UAEiz6S5Pyu1q3kD34mQpai14Xz0YWM7WVqRzAeNZZ9kPloWwxxCc2PbHkTQhbKfWc3c3y/VeGakXhGBfxCnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2zZDXiGexGiO4rjouJfy7iVvJzriAj1YhvUadpBkcqQ=;
 b=nptynYfSA+qIu4ZEHC+QSVuVb4xa5ABirj5jr01cuX0J2UKeXhJVp+zl64RmlbktrVxUc/yJu7KSvZ1cvoQo+1KfwdD6DY0cspaBoGqvhNO3VKUSEHaoYmeCOAjgnFR+toBfNvgdIHTeafJRDYPiLX1xPZUMsJ19WXwP0IoMc10u6l0BBYeT+ykD3SZ+gessE/B5Oscicw2c3vO/iQbXQ1LeMs0CL1vV7UwxWaVQssRFmwC3VVsljpLu1lRI0UuTqNJKW30se5/sXnX5Jit6JKEKdoQaUS5r32yPXpXz6dnkOPHZkuADobyaqT6BdqYgQ2TfkzDgnfOqOSP/YCWLqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2zZDXiGexGiO4rjouJfy7iVvJzriAj1YhvUadpBkcqQ=;
 b=RmUEOgr/N00BFmau335DKRNf/s6mExCitf6KvpVhIUeizNxfO5cWrVoI4URrbXlWWOzLfj5JAOJzJxDLoBlVtY8VZ4cQAmJhivivYaBuzydYtThQapYGB1ry4G5FBLq1qAqTZht2hPotEGvmcZDcT4UF7BIgM877meTW4nA8+Bg=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau
 Monne <roger.pau@citrix.com>
Subject: Re: [PATCH 1/2] x86/mm: avoid phys_to_nid() calls for invalid
 addresses
Thread-Topic: [PATCH 1/2] x86/mm: avoid phys_to_nid() calls for invalid
 addresses
Thread-Index: AQHZDuc9jXw99mNebki+EqZyGC5j4q5w6lcA
Date: Fri, 16 Dec 2022 19:24:54 +0000
Message-ID: <c982fec2-53ba-f448-e073-967925f61bbf@citrix.com>
References: <471bd202-7bf0-81be-e8a5-780ea5975a70@suse.com>
 <d503a684-1689-ef60-23e8-5eb6b33ab5c8@suse.com>
In-Reply-To: <d503a684-1689-ef60-23e8-5eb6b33ab5c8@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|PH0PR03MB6956:EE_
x-ms-office365-filtering-correlation-id: 00f09e58-90ed-41b9-22c9-08dadf9b3643
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 pWHtlqO9h/nQcEp0uA2lacmlMcAU6uQyZ7N3R8w2JntwhDtzXzeC5feJ7fjUG4WA76gp0PLvM5tTQ976/YXpuSAr95zdTCfIiiFKkPuDYnROUdOP4wTBwBm0+lUZtDet5vOIA4Z2s4D6wcbUrJzN/RbmYCmIf+UBs//2zcbkdTzeLQOu9pBTGUE6lLhbai+aFvoK2WgbnipvJR4hs/deF5yPkzm+yi4UGnJ4hQpoGtuJx5tzYG4RsXqVfJ8dZk4g0BzPwbFGDp0eIy3dzyzPzr3sl1/uN2duGRCRReSVCE4mWHwh5Y/slgujt4EZB4n0jJTLb8mnqHh1qRY/q7P32pDiJqbT+LtGywKaA2rXWw2O+0GYlC7kTcvSARcTQZfBazg8y+7+8Br3mV7DZetagiM2A2p9RzpoKxT3mqDCHkAmrP8iAMpa8LRI5Jzfk2GIJ7++e8gKv+cn74VyBV14LIVmX1yTopMq7xFGxuv/j1xti+t1+ZF6MekIqLLy9QSjZGj/jIlIHQLfvhGtYmLVy2FscHzY9G870tLQngRUBliTfQNbqEI8giZjjhF8qwksAhqhO/gXaNpu0Br+rA2KirPA7ITDtRZGcXbyrSCMiHhN69beZ/PyNBGqZcwTy45RpOgEUS8bkDi23GG81yCH4vVqNXRIpULMX7IL++9wbMz4aS1XnJwDurbdUX9duL6N7QwcN5Z/mYaEvqnvviP0vdAhQKxNwNGOfgYMFRFwdrodNJXJwNvLm+DaNGRUGMXHjbUOuz0zOf2wBihwq6YOrg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(451199015)(83380400001)(86362001)(31696002)(122000001)(38100700002)(38070700005)(2906002)(5660300002)(41300700001)(8936002)(4326008)(53546011)(107886003)(26005)(66476007)(8676002)(186003)(6512007)(64756008)(91956017)(66556008)(316002)(6506007)(2616005)(66946007)(66446008)(6486002)(110136005)(54906003)(478600001)(31686004)(66899015)(71200400001)(76116006)(82960400001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d3dkWlp4U2RHQmtqdnZZYWM3V0hmR1RCcDArNGRkT1BMaDJFNkZZL0ZPcmlR?=
 =?utf-8?B?dmJaR25GZnpFVkxNTmoyaW5OeVNab3JrTE9PcDhYb1pjMVN1WlA5THdpVGdY?=
 =?utf-8?B?WnZtWVliZTJsVDUvUGxvMHZBVzdvNzA5akRiWDBwRmVNaEw3STI1NFVEbmxj?=
 =?utf-8?B?bnQyTGVCNVYwOWNiTldrYVRReE4wTmhmSXNYU01WYVhlOTdoTUhOKzF3eTht?=
 =?utf-8?B?WTJlMS9xSW5ENjV2SGxPYXNnL1VNTHZZN0pQNTRVT2NVSERPRXB2TGNqOFVk?=
 =?utf-8?B?S2hwNTN0OHdSeGZFU2FZK3NBdFJYeFN6cmkzbHdRdUczcXpqMElkMlFnaHJQ?=
 =?utf-8?B?ckJnSHRIc2FuMWxkNVFMNk1KQm5nV1BLRTNIOThEQ0EzOFBOLy9JaHdpai91?=
 =?utf-8?B?b1A0MW1OUndjbVNlaGFSRFBxb282SVFQSExGVlYwMUh3TEVEMTgrS0Rta1hp?=
 =?utf-8?B?em9WNkU4cjFjQ2JCSnFDVmhqNUxQa014SWFLUklMT1NwTHB0M2FZOTlNUSt6?=
 =?utf-8?B?dnVTV0I4ZFh2YXBMYWxpblNkcTRrRG5ONFhRd3RxUzFKMHg4d3NlRXRHanFB?=
 =?utf-8?B?ZWlHdnMzN1V2QnRWeEJDd3RWeTF0SjdDVklxTEpVdUlVSi9HSEVVcDhxRlN4?=
 =?utf-8?B?bEhqSGorc2IyL2I2NldHUlFtUDJOWVJuQ3FBSkk5d1lSQVQyYUIwOTdQa29i?=
 =?utf-8?B?cS9pSzZGeWlweXZuQVA1bkpDdmE4Q0tFODA1UHNpMnhoWXIrY0tCTXRkeUtT?=
 =?utf-8?B?M01wejdPRVNNZjZ5Mk5xQmdoWEZvb2NjYU5CeE5pVVI2ZkJ0OFhrd3FwQjRR?=
 =?utf-8?B?NklQWmxod3ZoSWU5VW9vQUpUZ3NYVUtaMjRFVUxvVU1WM0k1YmR1VGFSeGRq?=
 =?utf-8?B?d1ZMaWt4RVJWRVVlaDFwd1lBYTU5bUZCdUY1QmpNUmVYcnFWVDd5bW9xbTNI?=
 =?utf-8?B?dnpzZTE3M0M4ZlBXbld5Z2xlVmdpeGJjeWZPSnhyRXBKNnA0NW8vR1JjN285?=
 =?utf-8?B?TXArRFJUMU11VFI3VXgvN0ZlbnVadGpTQTBLNkJ2R3VDME5odlgreWlCdFFW?=
 =?utf-8?B?cCtQT1ZQWEx1UHF0OERWN01uSkVYaVlHeEJNbGlhazVQK05jVFZuOHU3ZHdY?=
 =?utf-8?B?OUVlRzhHMzlXbFNML2dWTmt3dC9vVXBzVWl3a1JJeTNFYytxUmk3RlhGV3N4?=
 =?utf-8?B?NVpJdjJIc0hZYjVnL2VzN0hOS1laQjd1VVhiazF3RGVjQ202aXpibHpWSktp?=
 =?utf-8?B?YTUxUW9BanRxWXVMT2Q0ZDlIVUtkeHBZa094aG9qclJWT1VqM3JldUpmejJa?=
 =?utf-8?B?cXhwUSs1N0JpUjl2Z3Z4ZlJJWlpONWttaEVMM2srWWppUWt4eTU3SkJhNEF2?=
 =?utf-8?B?M3VMNWhkN2hYa25BdTlwWCt4NkZiY292Rm0xSmYyU3hzOTRsMk5Ka054SzU2?=
 =?utf-8?B?dTVkWjZSRjBpcHZkd1JmT3FrR3d0Tk8xOEsrT25XZytuOC9UbExVbU94Ui82?=
 =?utf-8?B?LzVJSUxuSWpKUndnbU5xcTZET0p1SGhkNlV3Yk9VcXJESG1va0h0c2ZUMWhN?=
 =?utf-8?B?bmhjMHRJUzM2NFFhcWN2ZUZ3OGV3dFNscGFHZG5rR0J3U2hVWVhtSXVONFla?=
 =?utf-8?B?dC8xOFY2WnRrb1BQTk00TC84aEhEYkNQUjZYeThVWDdxQjZzU0VaakVpZTdN?=
 =?utf-8?B?VGMxeUlOOHhPeWdYaUs3Y1hvek4rN3pUQ0dzVFNDRWdmV1ZxNXl6SlA3Rk03?=
 =?utf-8?B?blo0amZNZm13OFMvWnJhc281cDZnalgzRHBMZ3BoOHJOOG4wckNtOVNtVE9C?=
 =?utf-8?B?SjYyMHNkczl0SlVTZFc3eUxPYmlmOW1JQVl2NG1OYjZJdjErV1ZwOTc5RXVa?=
 =?utf-8?B?ZkpYK0g3Q1BjUWdPWHhIV0N1NTVVd3FEWUszdEExcThhQjY3TXFuVENORm9D?=
 =?utf-8?B?dU1tMGZrTVZ0K0o1RzY5UGVDR0ZBN1Y4a09EQVg4eGJvZUY0eW0zQjc1ZU5q?=
 =?utf-8?B?NTBkQm5zNVkySldwdWI0Z1BpVGdVbWtvbkJyY1VoSkRieXZiK0RBQndhQXVh?=
 =?utf-8?B?VjdtaU9aQmlBSjFHSjBsRG0xWTdwNGViU21ROG1SS1huY2ptbFBCUVZSWEVj?=
 =?utf-8?Q?S+PqbuZi2S444GPqzs2fQoYj4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7E3426990A31345A8321B37D2CADB64@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f09e58-90ed-41b9-22c9-08dadf9b3643
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2022 19:24:54.9484
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FhIqXepz7vbKW4OJ1+9YdTyKMwOAdQSR50CQ0MGnVjBU9vyHlBRCawg6U6M7KuYka615O8IpmZ7SR2yMukBOlg5jXV1GkaCdt5vI3Srtaf4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6956

T24gMTMvMTIvMjAyMiAxMTozNiBhbSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFdpdGggcGh5c190
b19uaWQoKSBub3cgYWN0aXZlbHkgY2hlY2tpbmcgdGhhdCBhIHZhbGlkIG5vZGUgSUQgaXMgb24N
Cj4gcmVjb3JkLCB0aGUgdHdvIHVzZXMgaW4gcGFnaW5nX2luaXQoKSBjYW4gYWN0dWFsbHkgdHJp
Z2dlciBhdCBsZWFzdCB0aGUNCj4gMm5kIG9mIHRoZSBhc3NlcnRpb25zIHRoZXJlLiBUaGV5J3Jl
IHVzZWQgdG8gY2FsY3VsYXRlIGFsbG9jYXRpb24gZmxhZ3MsDQo+IGJ1dCB0aGUgY2FsY3VsYXRl
ZCBmbGFncyB3b3VsZG4ndCBiZSB1c2VkIHdoZW4gZGVhbGluZyB3aXRoIGFuIGludmFsaWQNCj4g
KHVucG9wdWxhdGVkKSBhZGRyZXNzIHJhbmdlLiBEZWZlciB0aGUgY2FsY3VsYXRpb25zIHN1Y2gg
dGhhdCB0aGV5IGNhbg0KPiBiZSBkb25lIHdpdGggYSB2YWxpZGF0ZWQgTUZOIGluIGhhbmRzLiBU
aGlzIGFsc28gZG9lcyBhd2F5IHdpdGggdGhlDQo+IGFydGlmaWNpYWwgY2FsY3VsYXRpb25zIG9m
IGFuIGFkZHJlc3MgdG8gcGFzcyB0byBwaHlzX3RvX25pZCgpLg0KPg0KPiBOb3RlIHRoYXQgd2hp
bGUgdGhlIHZhcmlhYmxlIGlzIHByb3ZhYmx5IHdyaXR0ZW4gYmVmb3JlIHVzZSwgYXQgbGVhc3QN
Cj4gc29tZSBjb21waWxlciB2ZXJzaW9ucyBjYW4ndCBhY3R1YWxseSB2ZXJpZnkgdGhhdC4gSGVu
Y2UgdGhlIHZhcmlhYmxlDQo+IGFsc28gbmVlZHMgdG8gZ2FpbiBhIChkZWFkKSBpbml0aWFsaXpl
ci4NCg0KSSdtIG5vdCBzdXJwcmlzZWQgaW4gdGhlIHNsaWdodGVzdCB0aGF0IEdDQyBjYW4ndCBw
cm92ZSB0aGF0IGl0IGlzDQphbHdheXMgaW5pdGlhbGlzZWQuwqAgSSBzdXNwZWN0IGEgbG90IG9m
IGh1bWFucyB3b3VsZCBzdHJ1Z2dsZSB0b28uDQoNCj4gRml4ZXM6IGU5YzcyZDUyNGZiZCAoInhl
bi94ODY6IFVzZSBBU1NFUlQgaW5zdGVhZCBvZiBWSVJUVUFMX0JVR19PTiBmb3IgcGh5c190b19u
aWQiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoN
ClRoaXMgZG9lcyBhcHBlYXIgdG8gZml4IHRoaW5ncy7CoCAoVGVzdGluZyBoYXNuJ3QgZmluaXNo
ZWQgeWV0LCBidXQgYWxsDQpzeXN0ZW1zIGhhdmUgaW5zdGFsbGVkLCBhbmQgdGhleSBkaWRuJ3Qg
Z2V0IHRoYXQgZmFyIHByZXZpb3VzbHkpLg0KDQo+IC0tLQ0KPiBSRkM6IFdpdGggc21hbGwgZW5v
dWdoIGEgTlVNQSBoYXNoIHNoaWZ0IGl0IHdvdWxkIHN0aWxsIGJlIHBvc3NpYmxlIHRvDQo+ICAg
ICAgaGl0IGFuIFNSQVQgaG9sZSwgZGVzcGl0ZSBtZm5fdmFsaWQoKSBwYXNzaW5nLiBIZW5jZSwg
bGlrZSB3YXMgdGhlDQo+ICAgICAgb3JpZ2luYWwgcGxhbiwgaXQgbWF5IHN0aWxsIGJlIG5lY2Vz
c2FyeSB0byByZWxheCB0aGUgY2hlY2tpbmcgaW4NCj4gICAgICBwaHlzX3RvX25pZCgpIChvciBp
dHMgZGVzaWduYXRlZCByZXBsYWNlbWVudHMpLiBBdCB3aGljaCBwb2ludCB0aGUNCj4gICAgICB2
YWx1ZSBvZiB0aGlzIGNoYW5nZSBoZXJlIHdvdWxkIHNocmluayB0byBtZXJlbHkgcmVkdWNpbmcg
dGhlDQo+ICAgICAgY2hhbmNlIG9mIHVuaW50ZW50aW9uYWxseSBkb2luZyBOVU1BX05PX05PREUg
YWxsb2NhdGlvbnMuDQoNCldoeSBkb2VzIHRoZSBOVU1BIHNoaWZ0IG1hdHRlcj/CoCBDYW4ndCB0
aGlzIG9jY3VyIGZvciBiYWRseSBjb25zdHJ1Y3RlZA0KU1JBVCB0YWJsZXMgdG9vPw0KDQoNCk5l
dmVydGhlbGVzcywgdGhpcyBpcyBhIGNsZWFyIGltcHJvdmVtZW50IG92ZXIgd2hhdCdzIGN1cnJl
bnRseSBpbiB0cmVlLA0Kc28gSSdtIGdvaW5nIHRvIGNvbW1pdCBpdCB0byB0cnkgYW5kIHVuYmxv
Y2sgT1NTVGVzdC7CoCBUaGUgdHJlZSBoYXMgYmVlbg0KYmxvY2tlZCBmb3IgdG9vIGxvbmcuwqAg
RnVydGhlciBhZGp1c3RtZW50cyBjYW4gY29tZSBpbiBkdWUgY291cnNlLg0KDQp+QW5kcmV3DQo=

