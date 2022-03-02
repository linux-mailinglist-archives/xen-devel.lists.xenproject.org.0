Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D12B4CA62B
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 14:39:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282242.480876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPPCO-0000jg-J0; Wed, 02 Mar 2022 13:39:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282242.480876; Wed, 02 Mar 2022 13:39:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPPCO-0000gc-F6; Wed, 02 Mar 2022 13:39:24 +0000
Received: by outflank-mailman (input) for mailman id 282242;
 Wed, 02 Mar 2022 13:39:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5HSw=TN=citrix.com=prvs=05368ea7b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nPPCN-0000gG-1o
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 13:39:23 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 294580f1-9a2e-11ec-8eba-a37418f5ba1a;
 Wed, 02 Mar 2022 14:39:21 +0100 (CET)
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
X-Inumbo-ID: 294580f1-9a2e-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646228360;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=bPa0UYqeoFtBIxCTPcVqZ7v/KbpZ7TJn1HxTyYytDYk=;
  b=F2JP5LwaW8tVQi+wdsIGI0lEO97i54cjXq35VCPERlDZQYPMRayDjYNI
   FlOk6/T5ts1N2jarW0K09Pq+qhb133QnKVoalV8J+EXV9Uos495v73Lwy
   Ne7I9Qsl+2wlNH9qGNey+ux4Y6KmTIbyVJstCNSZLFxMkv/EE6z4h4HyF
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65212065
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:lJMfjKlJScLPLGxtcpid4W7o5gycJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNDGuAaPnfN2vxetB2aI/koUNS65eEyIMxTgtvpHg3QyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DiW1nV4
 rsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYGSAELrP0o+UnDBBZIj9TOp8eyuXcPi3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3k3ds1zzGS90hRojOWf7i7t5ExjYgwMtJGJ4yY
 uJHNGA2NkyePnWjPH87GI4gtsr13kPNbmR3lXCFoI8cv07MmVkZPL/Fb4OOJ43iqd9utlaVo
 CfK8nr0BjkeNceD0nyV/3S0nOjNkCjnHoUIG9WQ6fpCkFCVgGsJB3U+V1G2vP24gU6WQM9EJ
 gof/S9GkEQp3BX1FJ+nBUT++SPa+E5HMzZNLwEkwFGq57rK2z2YPDcNTw9fRdsU7P1sXiN/g
 zdlgOjVLTBotbSUT1eU+bGVsS6+NEApEIMSWcMXZVBbuoe++enfmjqKF48+S/Dt0rUZDBmtm
 2jikcQou1kEYSfnPY2f9EuPvT+jr4OhouUdtlSOBTLNAu+UieeYi22UBbrzsK4owGWxFADpU
 J04dy62trpm4XalznHlfQn1NOv1j8tpyRWF6bKVI7Ev9i6251modp1K7Td1KS9Ba5hYJ2a3O
 BeC51oAvve/2UdGi4ctOepd7OxwkMDd+SnNDKiIPrKinLArHON4wM2eTRHJhD28+KTduao+J
 Y2aYa6R4YUyUsxaIM6Nb75Fi9cDn3lmrUuKHMyT50n3gNK2OS/OIZ9YYQTmUwzMxP7dyOkj2
 40EbJXiJtQ2eLCWXxQ7BqZIdQFadSVgXMuuwyGVH8baSjdb9KgaI6a56ZsqepB/nrQTkeHN/
 3qnXVRfxka5jnrCQThmoFg6AF8zdf6TdU4GABE=
IronPort-HdrOrdr: A9a23:LWbXw60LZ8UVUdc0MhpZpAqjBRxyeYIsimQD101hICG9Lfb2qy
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
X-IronPort-AV: E=Sophos;i="5.90,149,1643691600"; 
   d="scan'208";a="65212065"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3uLcszBbSjFkyR5CVafnaka/jBECvbi3HyOjCHydtJJuj4PbhpZyhRQ8757Gtes7vidKgJkwSl1N87NbR3KggSjyHqvqtMGEdbFcag73WLGaN72QG4vsS9LcjcNQwDg7Ka4LEvd8PoMmbXqA/1qsW5G7xpanLUuiBkZrQbkjqhvsx3cjNyzUxjcI7kLPzJqDv3vB0J2w8vjSHZvcB2fxPK+i4t4/wT2v4Twg7GdiKkEFk+GnbsIKvrz/2T+Snk8BWSIBuMA0ii59z4DgEF09cv+5jVKtgWQ/kTXa2KpmzrYWmefAeK0QHweZnKwYM6edcuxMZ9YavFYHbXQJYV/1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bPa0UYqeoFtBIxCTPcVqZ7v/KbpZ7TJn1HxTyYytDYk=;
 b=QRwcfv91xtirrKrhpFBl/x+S+C6aypRImiOOTAORrcOPV8T8CvAKGuJv005ii+4wSp0oh6/+sLigdLPQLUMwjGqYVI560jZZDO6hn5IziTQXI+/dGorBW1SPDt8hAktI1qJ0F5sXPCzhm6sHD2K1exDeli0ZgOG9cVDSBzGvfIFliyAvn1mnoxhkn3PhOLvZAQxq9prp7m8WfJGjO8qkZONDIQ1lSWtSC588VuaToJaPXh6TIBjMkajuUIQ21R2eHy94P92mZZsAlIZBjl3iQQWxwMlalak6BYQ3/8PlGZuN+Igm1L52/LPU14YVP/7OMzpUqzAhDfQix9y9fRz6vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bPa0UYqeoFtBIxCTPcVqZ7v/KbpZ7TJn1HxTyYytDYk=;
 b=sK82Ruq2gd2MmJlN6+IZLtCnBKRvDsFl+YtZOOlNdLkcdhPOxEgridHyr8Xl3r5cy5We4xMKvqDfzvLLaeoMZ3HQkeoArMj6EfGk4oxhz7RBKrTVXC8f+k3vx4rEgLya/BKQ8oaJ8YAs/fswYuz5aMKgONtg8pn8Cey4I1WK8y8=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2.2 8/7] x86/IOMMU: Use altcall, and
 __initconst_cf_clobber
Thread-Topic: [PATCH v2.2 8/7] x86/IOMMU: Use altcall, and
 __initconst_cf_clobber
Thread-Index: AQHYJ+IV6PtRJY8p5U2wBnUH9jKzdqyj8n0AgAa3aoCAASBXAIAAIhyAgAAGJQCAADOGgA==
Date: Wed, 2 Mar 2022 13:39:09 +0000
Message-ID: <15868475-0702-c884-143f-366b9d79a255@citrix.com>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
 <20220222114711.19209-1-andrew.cooper3@citrix.com>
 <e8b71b3a-55a0-31a2-b2ab-3b2470680709@suse.com>
 <5fae516a-17c1-0ce4-c46e-909a83c0e273@citrix.com>
 <60f3c942-3822-87dd-df6e-8b64ed4d17c4@suse.com>
 <e41848a6-9aaa-f0d3-0c81-2e0e4e96a6a4@citrix.com>
 <67ff91f4-e5fe-47d5-fdb8-9a302beb6e2a@suse.com>
In-Reply-To: <67ff91f4-e5fe-47d5-fdb8-9a302beb6e2a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 78d1ccc5-e438-46ea-a916-08d9fc5207c7
x-ms-traffictypediagnostic: CO2PR03MB2341:EE_
x-microsoft-antispam-prvs: <CO2PR03MB234199E62C5BD8CEA23E8317BA039@CO2PR03MB2341.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tc+CDrpRyNIhaSIeUwCWZAXB1lvTyBEbh6zL8tRs464Hus4i2tnjZ+x4Mw9fnkcRpLdzP0EQ6oCk/u7OmfbFLa8COGUCfL7aUIZTRWdzNxGu4E7KQ8v2UI0GK5HN3zBc22EraYrTPlMSWXfgUulPlxDKMqTq67qFhuUwHY5r8F0DswxHd0qVFOIRvbq9VLniAWLFZL52psh4KSxKSUrAuep1QZj9ydZKOLko12HDyrWWHu3dVRi6RT2DXUHhS8xBzJwTL+xFpjcHVnqZCOHIjN5Tf2d/1tUEes5cdKkDLXbK5P9+wphhL7UEU9x/gH+IYnEc1vmAVFr4Slil7VCufD62+Vxm7iAIieizw282heFhTJiunWnrpQcQbU6l/muE1bTPCUo6HXRLHhRajkCgDPsaGXDshzrLdWpxLgT0JP/Ivxnliam7UUbj6JK7s3aKOEx8sXiME5Vdb1ifNMj4pA34aBEbHZsx7HPtQa6NmThGb6zH03ig4J3h8Ag4Bo6fNIa1XLojp7DNo/mWyGjaMr3HtzzZBykwwK0YQo36ABGXv9pPREFEr5sfV8qoELEtN0Ot1HfIrUcQ+v8q8KFxSwBZfvIViE7Z9vxPP15CqFmTg7OccVOvV46V/BYkClzGTQ3hdSqelWHBJsZ7uReVW/6AXgSmPuMM27kFoPqvMwUW08J/9kyQbpCEDq4A6tesNqxpnLBy6PvqetgkCrROBDlGzL2hGqPsJK9SsE7DHUQ5YnruDMAPM4OEx1suoSSWWLHl2Qo2J1VtrLsJfW5KJhOzoV8hp1OmtFkpx0NhnQkGVICIbu448SacL/dbJt6x
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(2906002)(6512007)(83380400001)(82960400001)(122000001)(6506007)(53546011)(186003)(2616005)(26005)(6916009)(54906003)(316002)(8936002)(71200400001)(4326008)(31686004)(8676002)(6486002)(64756008)(66446008)(66476007)(508600001)(36756003)(91956017)(66946007)(66556008)(76116006)(31696002)(86362001)(38070700005)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MU5GLy9vYXBZaGNGZU5pQ3ZDKzdDRmNxR2prMERPc08zY0ZGQVl2WnFQTzZB?=
 =?utf-8?B?ZFNOZ0JPVVpGQ21RMjlvbUZPYjVQazBGQ2xlbE1EYm1NQ2FjdGFlTklKK0Z6?=
 =?utf-8?B?WGhRK0tid1lSQ2FNMVh5VHQ3Zmg0cm0rOTN6ZFpNd29tSURyM2l3U090VVhv?=
 =?utf-8?B?cjU1TzdDVzNvazRLY0NtTHpWWmMyZW5LL1o2ZG9NSzlpb2VNUkxIY2dVUDlw?=
 =?utf-8?B?ZWM2NUxQeDQzcHFPUE5yV09FZFo0a1hGOUdwWisrRlUrUmZ2Um5PM3ZoNXo2?=
 =?utf-8?B?UkpPREZ5dnd1VUpaOVJocVNyZzZjSWVUQU4rdmRtVHAybVl3d0xTcFJmanhC?=
 =?utf-8?B?MFJpWGVZcldFRnkxZG9QMWVzN0RnVDNmNXJaSlh4N3IycFkzVWFrWm02d0RZ?=
 =?utf-8?B?amkwSzdmZWNrU0hxSXRwdFBvZTFObjNka1lGMUhGdDVuYldGQld0dE5Tei8z?=
 =?utf-8?B?aVhtSnRKREtYRmVnSVBEbnN0bUZzTzdDT005Z0l4L3dQSUhxb1VoalllbEF1?=
 =?utf-8?B?UkVSNytiTUQzZHlEODU1YlpvQlFOZHUvNFJUekdSa3pRQmtNc2pZbHE4YmF1?=
 =?utf-8?B?VHV2T0x3ZWJWVWs1cXJtVXlIenJybEtRckxOaGJiSUs0a1hwQ21mNXhQTDkv?=
 =?utf-8?B?Q2hCMW10b0JBWWtTR1hwRTZkd3JNM01ic0lKMFJaTmJTd3o0bFlCdDBRQ3NN?=
 =?utf-8?B?RnI1cHVNZWNJQ3NXaVVLazkwVllZeW1EaGVSWnYrV0RrSGN1NjM5QjVFekZx?=
 =?utf-8?B?OG83NFN6Z2REWTVjVUZhMWR1NW9CS1BxQ3hvN09zTVY0UEdsWlhDNnBHaHIw?=
 =?utf-8?B?cVNVYUdid1VRVWZjTW1YMy9PNHRDSXcvOEdwM0NrMDhGNyt4enhsZ0FzcFV4?=
 =?utf-8?B?N3V1ZjZQMzdNSEJ6ZEJlMnVBdXZsM3NVc1o3Z3BjYnRwRHhRbHRIQTI4ZHZ2?=
 =?utf-8?B?R2lZM0dJWFdLc1A4OHFDbXE3L1Y5ZllGRXExWTBxSHlIcUJjQXVnNEhuM1Zz?=
 =?utf-8?B?QlV1eVl1SG1RRDY4WXd0KzlNbThrWnllVW5HRDNVQ2dpY0NIRXhqYS9Gd3dz?=
 =?utf-8?B?cU9uNjIxVUlpZTZNQWVjWmxyZzdIdkZPQzMvcVdEZG1EZUlnZ0lHYWVValQ3?=
 =?utf-8?B?YzNBUkt0LzNnRmZpOVhGSW5nZkhJV0I0RnRVSEtVNFlndjBWUlROOC8zYXh0?=
 =?utf-8?B?d2hNY3hRTHpMdElCTzBvUFZJYkhmQlUzK2dORVRtTTRQSWtNZyt4R3pRU0pa?=
 =?utf-8?B?NVpjNnY3RUgzbDVkaWVnNmxPeFBLRWZqTGx4bHlHbkE2Q3NlU0QrRGNQMUpC?=
 =?utf-8?B?UHl0R2Z3cGNpVnBVNFdmY3NxRDdhZ2Nrcm9SZDBmS1VzS00zU08ydUsvUXZL?=
 =?utf-8?B?QkhCYXNXYUF4b2dYdVBSdjRGZVkrTVZtSXVrcitOYlJIcVU4dXZxK3lFTVFF?=
 =?utf-8?B?YzRXVmYwOFBnRnVYc3ZNRXVvVjN4bk1sdW90ZnNyYi9OVDZSNGJHRU83NlJZ?=
 =?utf-8?B?VjVFVWZzMUlVSWxCQlpndFBZbURFTXNRcUtDS2g5Rys5N1VwUjBGOVVNZDcw?=
 =?utf-8?B?dm40L1JxZXN1SzJzRU1SQjhTOW10NVdNc0dLT1BHNVZjQW5ubFR6YVp5U2du?=
 =?utf-8?B?Umg2VnZLUGpVZWh3SEg2dXRnckNFbks5dG9Va1cyeDVLYnVibFNzdjdWWUUv?=
 =?utf-8?B?RjNXdy82dUtlOGZLTEZNcFFJenM3anYzT1FjKzF6U3RneDdXUmFmWDNFblUr?=
 =?utf-8?B?YlZaRXFXYWM4cUs5OG1SekxOcWhaYjREQVAvbG9GRnZsOHNheVRUZkZPOTdN?=
 =?utf-8?B?MnZQUVRPRmtnbUUxc2JpVUNZdmZiZDcrVkVXeGI4dWdzSVVMQzM4MUR4WmZE?=
 =?utf-8?B?K0hRQUFqVWNGUUt1bFAyL09QeW0vckpCUlhzSjVTSnFnRmk5NFo3UW5EZFZE?=
 =?utf-8?B?Mm9ZenliWFJOSlZUTGFBdVJ1N2l5U3l0UjdITU9NVkt3TW5MT2NLZTU0dDYv?=
 =?utf-8?B?VkIxM0szZU9zMnkvK3hUcTBramJ4dWc3NThKa1R5WSs0TE9lWXZtWkEvRHVk?=
 =?utf-8?B?WHlKdGwxTlpjZE1QeFZNUDBOaGFDMEU0R2xDSFlqR1J5U3VGOWFPMEV6UVR6?=
 =?utf-8?B?Q3Z2QVNCdzlXM2E0Sk4xTzFwdEtDTitYYnUvSGlCRHRtNTRUbGt6WEJ2cGU1?=
 =?utf-8?B?azJ4UkVqKzh6TXBhM2J5RHhkSEVwZ2FhSlRhWkI1a1pYVHc2cWhyWnpqc2w0?=
 =?utf-8?B?SExBSDRZeXdNYk5rTFhsUFUzU3pBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0F10CEE52BB3D489D67A5712FD0C744@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78d1ccc5-e438-46ea-a916-08d9fc5207c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2022 13:39:09.6429
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1afsKz8bcvosRs2VjI40Tpl+owxZGCzHGhIHMStO8FGtrbZ5lyvkep+CNJEDVHayrZoU+E4ZMVI/BoLyCLTXlv8VyZar0vh6WK+pvPDgTa8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR03MB2341
X-OriginatorOrg: citrix.com

T24gMDIvMDMvMjAyMiAxMDozNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDAyLjAzLjIwMjIg
MTE6MTIsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAwMi8wMy8yMDIyIDA4OjEwLCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBPbiAwMS4wMy4yMDIyIDE1OjU4LCBBbmRyZXcgQ29vcGVyIHdy
b3RlOg0KPj4+PiBPbiAyNS8wMi8yMDIyIDA4OjI0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+
IE9uIDIyLjAyLjIwMjIgMTI6NDcsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+Pj4+Pj4gLS0tIGEv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUuYw0KPj4+Pj4+ICsrKyBi
L3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9wY2lfYW1kX2lvbW11LmMNCj4+Pj4+PiBAQCAt
NjI4LDcgKzYyOCw3IEBAIHN0YXRpYyB2b2lkIGNmX2NoZWNrIGFtZF9kdW1wX3BhZ2VfdGFibGVz
KHN0cnVjdCBkb21haW4gKmQpDQo+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGhkLT5hcmNoLmFtZC5wYWdpbmdfbW9kZSwgMCwgMCk7DQo+Pj4+Pj4gIH0NCj4+Pj4+PiAgDQo+
Pj4+Pj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgaW9tbXVfb3BzIF9faW5pdGNvbnN0cmVsIF9pb21t
dV9vcHMgPSB7DQo+Pj4+Pj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgaW9tbXVfb3BzIF9faW5pdGNv
bnN0X2NmX2Nsb2JiZXIgX2lvbW11X29wcyA9IHsNCj4+Pj4+IEZvbGxvd2luZyBteSBpbml0Y2Fs
bCByZWxhdGVkIHJlbWFyayBvbiB4ODYnZXMgdGltZS5jIEknbSBhZnJhaWQgSSBkb24ndA0KPj4+
Pj4gc2VlIGhvdyB0aGlzIGFuZCAuLi4NCj4+Pj4+DQo+Pj4+Pj4gQEAgLTI3OTQsNyArMjc5Myw3
IEBAIHN0YXRpYyBpbnQgX19pbml0IGNmX2NoZWNrIGludGVsX2lvbW11X3F1YXJhbnRpbmVfaW5p
dChzdHJ1Y3QgZG9tYWluICpkKQ0KPj4+Pj4+ICAgICAgcmV0dXJuIHJjOw0KPj4+Pj4+ICB9DQo+
Pj4+Pj4gIA0KPj4+Pj4+IC1zdGF0aWMgc3RydWN0IGlvbW11X29wcyBfX2luaXRkYXRhIHZ0ZF9v
cHMgPSB7DQo+Pj4+Pj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgaW9tbXVfb3BzIF9faW5pdGNvbnN0
X2NmX2Nsb2JiZXIgdnRkX29wcyA9IHsNCj4+Pj4+IC4uLiB0aGlzIGFjdHVhbGx5IHdvcmtzLiBC
dXQgSSBndWVzcyBJIG11c3QgYmUgb3Zlcmxvb2tpbmcgc29tZXRoaW5nLCBhcw0KPj4+Pj4gSSdt
IHN1cmUgdGhhdCB5b3UgZGlkIHRlc3QgdGhlIGNoYW5nZS4NCj4+Pj4+DQo+Pj4+PiBCb3RoIG9w
cyBzdHJ1Y3R1cmVzIHJlZmVyZW5jZSBhIGZ1bmN0aW9uLCB0aHJvdWdoIC5hZGp1c3RfaXJxX2Fm
ZmluaXRpZXMsDQo+Pj4+PiB3aGljaCBpc24ndCBfX2luaXQgYnV0IHdoaWNoIGlzIHVzZWQgKGJl
c2lkZXMgaGVyZSkgZm9yIGFuIGluaXRjYWxsLiBXaXRoDQo+Pj4+PiB0aGUgRU5EQlIgcmVtb3Zl
ZCBieSB0aGUgdGltZSBpbml0Y2FsbHMgYXJlIHJ1biwgdGhlc2Ugc2hvdWxkIGNhdXNlICNDUC4N
Cj4+Pj4gVGhpcyBkb2Vzbid0IGV4cGxvZGUgYmVjYXVzZSB0aGUgaW5kaXJlY3QgY2FsbHMgYXJl
IHJlc29sdmVkIHRvIGRpcmVjdA0KPj4+PiBjYWxscyBiZWZvcmUgdGhlIEVOREJSJ3MgYXJlIGNs
b2JiZXJlZCB0byBOT1A0Lg0KPj4+IEknbSBhZnJhaWQgSSBkb24ndCB1bmRlcnN0YW5kOiBUaGUg
cHJvYmxlbWF0aWMgY2FsbCBpcyBpbiBkb19pbml0Y2FsbHMoKToNCj4+Pg0KPj4+ICAgICBmb3Ig
KCBjYWxsID0gX19wcmVzbXBfaW5pdGNhbGxfZW5kOyBjYWxsIDwgX19pbml0Y2FsbF9lbmQ7IGNh
bGwrKyApDQo+Pj4gICAgICAgICAoKmNhbGwpKCk7DQo+Pj4NCj4+PiBJIGRvbid0IHNlZSBob3cg
dGhpcyBjb3VsZCBiZSBjb252ZXJ0ZWQgdG8gYSBkaXJlY3QgY2FsbC4NCj4+IE9oLsKgIGlvdl9h
ZGp1c3RfaXJxX2FmZmluaXRpZXMoKSdzIGRvdWJsZSB1c2UgaXMgaGlkaW5nIGhlcmUuDQo+Pg0K
Pj4gVGhlIHNhZmV0eSBydWxlIGZvciBjZl9jbG9iYmVyIGlzIHRoYXQgdGhlcmUgbXVzdCBub3Qg
YmUgYW55DQo+PiBub24tYWx0LWNhbGxlZCBjYWxsZXJzLsKgIFdlIG5lZWQgdG8gZml4IGl0Og0K
Pj4NCj4+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5p
dC5jDQo+PiBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMNCj4+IGlu
ZGV4IDY1N2M3ZjYxOWE1MS4uYjFhZjUwODVlZmRhIDEwMDY0NA0KPj4gLS0tIGEveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYw0KPj4gKysrIGIveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYw0KPj4gQEAgLTgzMSw3ICs4MzEsMTIgQEAgaW50IGNm
X2NoZWNrIGlvdl9hZGp1c3RfaXJxX2FmZmluaXRpZXModm9pZCkNCj4+IMKgDQo+PiDCoMKgwqDC
oCByZXR1cm4gMDsNCj4+IMKgfQ0KPj4gLV9faW5pdGNhbGwoaW92X2FkanVzdF9pcnFfYWZmaW5p
dGllcyk7DQo+PiArDQo+PiAraW50IGNmX2NoZWNrIF9faW5pdCBpbml0Y2FsbF9pb3ZfYWRqdXN0
X2lycV9hZmZpbml0aWVzKHZvaWQpDQo+PiArew0KPj4gK8KgwqDCoCByZXR1cm4gaW9tbXVfY2Fs
bCgmaW9tbXVfb3BzLCBhZGp1c3RfaXJxX2FmZmluaXRpZXMpOw0KPj4gK30NCj4+ICtfX2luaXRj
YWxsKGluaXRjYWxsX2lvdl9hZGp1c3RfaXJxX2FmZmluaXRpZXMpOw0KPj4gwqANCj4+IMKgLyoN
Cj4+IMKgICogRmFtaWx5MTVoIE1vZGVsIDEwaC0xZmggZXJyYXR1bSA3NDYgKElPTU1VIExvZ2dp
bmcgTWF5IFN0YWxsDQo+PiBUcmFuc2xhdGlvbnMpDQo+Pg0KPj4NCj4+PiBBZmFpY3Mgb25seSBw
cmUtU01QIGluaXRjYWxscyBhcmUgc2FmZSBpbiB0aGlzIHJlZ2FyZDogZG9fcHJlc21wX2luaXRj
YWxscygpDQo+Pj4gaXMgY2FsbGVkIGltbWVkaWF0ZWx5IGFoZWFkIG9mIGFsdGVybmF0aXZlX2Jy
YW5jaGVzKCkuDQo+Pj4NCj4+PiBJc24ndCB0aGlzIChwcmV2aW91c2x5Pykgd29ya2luZyByZWxh
dGVkIHRvIHlvdXIgIng4Ni9zcGVjLWN0cmw6IERpc2FibGUNCj4+PiByZXRwb2xpbmVzIHdpdGgg
Q0VULUlCVCI/DQo+PiBOby7CoCBJdCdzIGJlY2F1c2UgQU1EIENQVXMgZG9uJ3QgaGF2ZSBDRVQt
SUJUIGF0IHRoaXMganVuY3R1cmUsIGFuZCB3aWxsDQo+PiBuZXZlciBlbmNvdW50ZXIgYSBmYXVs
dGluZyBzaXR1YXRpb24uDQo+IEknbSBzdGlsbCBsb3N0LiBBbiBleGFjdGx5IG1hdGNoaW5nIGNv
bnN0cnVjdCBleGlzdHMgaW4gVlQtZCBjb2RlIChhbmQNCj4gbXkgaW5pdGlhbCBjb21tZW50IGFs
c28gd2FzIG9uIFZULWQpLiBUaGUgQU1EIG9uZSBpcyBhY3R1YWxseSBhIGNsb25lDQo+IG9mIHRo
YXQgbXVjaCBvbGRlciBvbmUuIFRoZSBpbml0Y2FsbCByZWFsbHkgd2FudHMgdG8gbW92ZSB0byB2
ZW5kb3INCj4gaW5kZXBlbmRlbnQgY29kZSwgYnV0IEknZCBzdGlsbCBsaWtlIHRvIHVuZGVyc3Rh
bmQgd2h5IG5vIGZhdWx0IHdhcw0KPiBldmVyIG9ic2VydmVkLg0KDQpMb3ZlbHkuwqAgSXQncyBn
b3QgYSB2dGQgaW5maXggd2hpY2ggaXMgd2h5IGl0IGVzY2FwZWQgbXkgZ3JlcC4NCg0KQW5kIHll
cywgSSByZWFsbHkgd291bGQgZXhwZWN0IHRoYXQgdG8gZXhwbG9kZSBvbiBteSB0ZXN0IHN5c3Rl
bS4uLg0KDQp+QW5kcmV3DQoNCg0K

