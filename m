Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 907BF54FDED
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jun 2022 21:55:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.351560.578229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2I3c-0005Kr-Ib; Fri, 17 Jun 2022 19:55:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 351560.578229; Fri, 17 Jun 2022 19:55:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2I3c-0005HN-EW; Fri, 17 Jun 2022 19:55:04 +0000
Received: by outflank-mailman (input) for mailman id 351560;
 Fri, 17 Jun 2022 19:55:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vvnF=WY=citrix.com=prvs=160c9be11=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1o2I3a-0005HF-C6
 for xen-devel@lists.xenproject.org; Fri, 17 Jun 2022 19:55:02 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e16cc28-ee77-11ec-bd2d-47488cf2e6aa;
 Fri, 17 Jun 2022 21:55:00 +0200 (CEST)
Received: from mail-dm6nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Jun 2022 15:54:34 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by PH0PR03MB5703.namprd03.prod.outlook.com (2603:10b6:510:30::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Fri, 17 Jun
 2022 19:54:33 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::b402:44ba:be8:2308]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::b402:44ba:be8:2308%4]) with mapi id 15.20.5353.014; Fri, 17 Jun 2022
 19:54:32 +0000
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
X-Inumbo-ID: 5e16cc28-ee77-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655495700;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=IvsHZBL13OEveEHs+f3HEeTY34U1bMHTRvnFtFiSfqc=;
  b=eBJmbFNCvohhBh4kZ68PBHQQCz3x4sHF/YCzntY9fhtY0Rfc4fVft0WF
   EPnp40Jh9THjZKWvPV390l0UN5ksGVNiT+VbANxgwEJ9Z/em6S7IU8dOs
   gXuu0hBeefsAVXbPTnq9WQ8D8Ka6bFY6k2H/WabHLk01OSHLKQmlFzaKT
   U=;
X-IronPort-RemoteIP: 104.47.59.170
X-IronPort-MID: 73222233
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zOfsUakz1jpVN5gWD8ReVrzo5gzKJkRdPkR7XQ2eYbSJt16W5oA//
 9YtKSrfbaHbJie3LscnK96GQXl27cLSnNM3TQBoqy8xQnkRoJCVVYnHfxb7Y3qcc5DPFR04s
 5tCZ4CdfJ0/FCGA90z3a+W9pCIl3P7STLTyWbacakidKeMcpAIJ0HqPzMZl0t4AbaGFPj6wV
 fPOT+z3MQb/1mN4aTMdt/KNoUwztv3+6G1H5gVgPPlGsQfTy3BEUJ5HKa+PdHapGYM88sxW5
 grgIBNV2kuDon/B3/v8yu6TnnUiG+KUZU7U4pZvc/DKbiJq/0Te6Y5mcqtGAatro2/RxYopl
 owT7cDYpToBZcUgpsxMC3G0LAkmVUF20Oevza+X6JH7I+XuKhMA8t02ZK0EFdRwFtVfWAmiw
 ccwOjEVBi1vssrtqF6NpkuAsex4RCXjFNt3VniNVlg1B95+KXzIa/2iCdO1QF7cLy2BdBrTT
 5NxVNZhUPjPSzZRA21HEpE1pcuHnkT2a2NhsnSX/INitgA/zCQpuFTsGPz8X4XQAOlwwAOfr
 G+A+HnlCBYHMtDZ0SCC7n+nmu7Im2X8RZ4WE7q7sPVthTV/xERKUEFQCQT9/Kj/0xHmMz5cA
 xV8Fi4GgqU17kOmCPXgWRmxuFaPvwIGWsoWGOo/gO2I4vWPuVzDXDNfJtJHQOQjsM9tb2Y06
 gSytc7HDGVfqJquZ0vIo994qhv3Y0D5N1QqYCYYTAIe7sfquogbgRfGT9IlG6mw5vXlFDe1z
 z2UoSwWg7QIkdVNx6i95UrAgT+nut7OVAFdzgDeQmOs9UVnbZSsT5Kh9VXAq/haRK6bRFScu
 HkPm+CF8fsDS5qKkUSlQvgJHbyvz+aINnvbm1EHN4I66z2n9nqnfIZRyDJzPkFkNoADYzCBS
 FDXkRNc4tlUJnTCRaN5ao2+CsMuzID7CM/oEPvTa7JzjoNZcQaG+GRiYBCW1mW0ykw0y/hgY
 dGcbNqmCmscBeJ/1j2qSuwB0LgtgCcj2WfUQpO9xBOiuVaDWEOopX4+GAPmRogEAGms+205L
 /432xO29ihi
IronPort-HdrOrdr: A9a23:D0qmLq2Bfc2mPlMZEo0emgqjBR5yeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4uxpOMG7MBDhHO1OkPMs1NaZLUTbUQ6TQL2KgrGSpAEIdxeeygcZ79
 YZT0EcMqy9MbEZt7ed3ODQKb9Jr7e6GeKT9J7jJhxWPGNXgtRbnmNE43GgYyhLrWd9ZaYRJd
 653I5qtjCgcXMYYoCQHX8eRdXOoNXNidbPfQMGLwRP0njBsRqYrJrBVzSI1BYXVD1ChZ0493
 LergD/7qK/99mm1x7n0XPJ5Zg+oqqh9jIDPr3NtiEmEESvtu+aXvUlZ1REhkFwnAib0idorD
 ALmWZmAy080QKWQoj/m2qR5+Cp6kdT15al8y7WvZKrm72GeBsqT8VGno5XaR3f9g4pu8x9yr
 tC2yaDu4NQFg6oplW02zBZPysa6XZcjEBS59L7tUYvGLf2qYUh37A37QdQCtMNDSj64IcoHK
 1nC9zd/u9fdRefY2rCtmdizdSwVjBrdy32CHQqq4iQyXxbjXp5x0wXyIgWmWoB7os0T91B6/
 7fOqplmblSRosdbL57Bu0GXcyrY1a9Ci7kISaXOxDqBasHM3XCp9r+56g0/vijfNgSwJ47iP
 36ISRlXK4JCjbT4OG1re12G0r2MRSAtBzWu7Jjzok8vKHgT7z2NiDGQEwykqKb0oAiPvE=
X-IronPort-AV: E=Sophos;i="5.92,306,1650945600"; 
   d="asc'?scan'208";a="73222233"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Too1Imf7yeV3TLF1KydySpCfWSHDWszPM9iTMBc/xCbxpXAWer6ZLxha+zuLj7Z2SrnQn/tWWuVlMvQA01rsRAGSHnmAHYtUDawHITPAyij9NOOSK7BUD7CZiYwPplShabZ12rf0F+W0QHZ3axMVtAbkD9aWTkN7qKnkNvuiJmuLux8/LPpZh3IqbTRxQR0qRVwfef1A3hMWbkRaac5FGMneZ/a+CpypSFiMOlXFtiguwx/3gsrETjOQsdZvONJzr3uOa4Ry09UwYrpgSCPb9/pMq20VzzXN+m1emTnz/T/t91Y3kL/0YJOB5aPBooNqxqExhbfeVd6/hQyY/XomYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Axys3FCOi8XwWU+7Riro6JD9DbxQNYpWH34M95p3o8=;
 b=bCyZwnRvG3q6pHV5oq4AJHts+b/uYKxVa3b/rhlkpH8oTVUgE9SjQU75uVv4OE/xoTbvtMVLgntkT7uTFlDCgHoxGU1zDT26SNA4JSaC06g/e4l8QpmwAwT6dvMfZijD42TPvcnq4ka7GRgzFBa/3BxfUWH4gSYdXt/9FBk+Ges0+l5VE7cMAgOYuxKgZIVb583xZaaNXa++g6XK6uTns0V+8pglmv17NXZQYDjNl00SMu0TU65q41K2lfnFmgjqoeAUYV2ItDcnBax8vVatp/LqJ9evDZeUhR1Sf2vC2j6qjQjNN7FtC5EnKymwQqbCcU6/c9gTDEJyrDfb3XX3zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Axys3FCOi8XwWU+7Riro6JD9DbxQNYpWH34M95p3o8=;
 b=K0+H3LrxkUKqrBmKr5DvBZ3S/o2NeP9+s0+XJJ5l61MI5NutfZfGQI+/zvUDWFP4y0E2dwPWKBtTVstES/XYZjN/DudcdxbmrACrqAXoAIFBAvCOxkiFMDXtDiwJ0MxKF2Laf6kATL+rfpjvhY+KAHjo4jsu5Gs1xgdeeeuKMTU=
From: George Dunlap <George.Dunlap@citrix.com>
To: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Matias Ezequiel Vara Larsen
	<matias.vara@vates.fr>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Dario Faggioli
	<dfaggioli@suse.com>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [RFC PATCH 0/2] Add a new acquire resource to query vcpu
 statistics
Thread-Topic: [RFC PATCH 0/2] Add a new acquire resource to query vcpu
 statistics
Thread-Index: AQHYafskDxt9xTUpi0SpWmJ0NCtB9K1UNB8A
Date: Fri, 17 Jun 2022 19:54:32 +0000
Message-ID: <EEFF4C8C-F26D-47CF-8E5D-5E62BB6579BC@citrix.com>
References: <cover.1652797713.git.matias.vara@vates.fr>
In-Reply-To: <cover.1652797713.git.matias.vara@vates.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c560b9de-e001-4cdb-99bf-08da509b32c9
x-ms-traffictypediagnostic: PH0PR03MB5703:EE_
x-microsoft-antispam-prvs:
 <PH0PR03MB5703EE4DDDF1DF9F2C81645F99AF9@PH0PR03MB5703.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 6l+76oCglL6JWumXTUEeYiUTnYvCJ6IdK+gbLRT2ULfxPEPvygjd1zbprrk/i6ClDS76aKng2xBdjEJl+N7XPMbzEOfZA6Ns1T7e1TTWsnNm2OVnGuUjCHDfD3UPgicKQ8hQ3ua78Gz9Dr3x5h8F2q4nl9K9zlvkxgzr8RoZ1Na8NiDR8CiYBoZo4qdGJgE6/T0T5LcwjhCPi+PfGQUneAeKLfOlLhRH7sIOcyUQNu0lVzKrTHvxT5H1zp5pTCogkqAA3/z2FtCVwV0mai8/GSSaJiSa8LYxRDybWeCEffBVeiKMOLVqkcro5F2CGq2u4poI3gWmjtCmmX6L1DqYZK6un64Mx4AY4E1kAfjqt+HaRQAnLZU6g/P5b/tORC/MEB30RxIk9FIZyt/RiM92BxzV9mEXmzUhzWYs6DtFjEmJLVgyn9zByK7tuJqaRhqYZ1sLFqeO8IfobD6BlCS/9eKbQEqPmJULetN8mnf0KJNeC6TCPr2AIe8mNOK7KaV0Bq+V0YriCnPJjTNjxfXyFceewBKGqtkXJJeXaiveZp6fbZowug6tQDBmL21ylOJVdS+rAARkccVZwFPXTyJFq+iESJWP+5JZt0KVfKjm91SQqV+qAAo0IvuYgBbHb2nbQ/fi29qCBQ7mzCe2Vf3sDcpybpPfyW6F2wlIe+V8/1MTZr6vqK1hfLIMmDHlH2PxGEJPWEX+iniQR2dku360FVnO90jgKISb6ow6ZelVP+lcmiegHj0mhUqGtqfUb8I9WRj6L8ButgLODNd8474g4hptKDRfLh3C7rY9zoWWIJ+jQFUK9wri31DCQtW/TWa3ge6vaI3/7F9HIlEk05/k8A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(33656002)(8676002)(36756003)(8936002)(38070700005)(4326008)(91956017)(498600001)(66476007)(64756008)(66556008)(66946007)(71200400001)(966005)(66446008)(6486002)(316002)(5660300002)(2906002)(54906003)(76116006)(53546011)(6506007)(2616005)(26005)(6916009)(107886003)(82960400001)(186003)(38100700002)(122000001)(99936003)(83380400001)(6512007)(86362001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RjZpSVpSbXV1UnlUV1EwUHJNSkFZbEFJa0JlOVJCTU40c05Bb3ZCZ2Y4U3lQ?=
 =?utf-8?B?ckpyY3c5MjZuL3RJQmNaZFlVcnhPRmErUlZwTGpYL1AzRGJQWS9BYzVMUWpP?=
 =?utf-8?B?NkRydVZHVmNGUkF0WjVtSG8ySjVRbC8vZUE3K3pHYVlOU3A0U0ZLVDlnVmlh?=
 =?utf-8?B?R1ZWN2t4WEtDdFVxQmpISzFBVFRnRUFHY2NpcTlub2lLZXhjdFRqUTVLTkd1?=
 =?utf-8?B?Y3RIa1NKajdMYXdQNENHYzFLYkpIM2ZLekZKNGd4ZXoxaFBHU08zQm80MTY5?=
 =?utf-8?B?SkdNQVpHMVQ3NHNZV0YwcFlXcHk2Z3RnVlNvZVEzSzBheXFoL242Q0FlU0Iy?=
 =?utf-8?B?dSthMVZQclduNnlHSXlSaFRmR1BmR2ptRDJtNXBBR1VuNGd1YTBRanR1eEdK?=
 =?utf-8?B?WXoraE1sNW1VSm9xV2pKWkFjYkwweVQyeUsvcXRlK1F6K0dHZWo3a01KUnYz?=
 =?utf-8?B?SWJpK2VRQWc5ZmV4N3FyMmxWNEpPNC9qaW56VjVBaHZ1N0RPbVQwVUQ0Vm9G?=
 =?utf-8?B?alFYWXFrdGJ5T09hU1BGdGRmQ2NKTTZsYW1uUkZOclV0YW5tY1M2a2ZlS1ZM?=
 =?utf-8?B?RWlWRWR2YldEaEtxVk9lZ09VQ21ZUU90Qld5MGVVSGNxSisvb3F5TlQ4MWNn?=
 =?utf-8?B?M284YnAzVjNZRTFiUnF1QlYydmRoQjF4eEFMdnByeFZ4c2pJKzZwZFRXM3c1?=
 =?utf-8?B?N1o0M3drdG03aW9LcnRDZ0dJajAyUnFPRHhycEkrdkc5b2JEOWMwM3ZLTldu?=
 =?utf-8?B?L3lDZVFGRG94NEIvUlVUYUlmc0FWMUJ1a3BMdlVMM0QwMEJnTzYvWTVZekc0?=
 =?utf-8?B?bkhOVHBUaUpzemV2bUM3T3JsdFJBNktveUFqOGdzaC9Ialh6TXNvdDRGVUFF?=
 =?utf-8?B?V3BrWEtpZzBURUFpQmJLMm5NUkhCYksvODZLQTEyTU1mNEhINlpvK3hKcjFT?=
 =?utf-8?B?NUY3bnJFUWgyMVVuZnR3MGVKeDNaK25oUjZnM0tpQ1lyeWJ3Tk1hRWhXTk9S?=
 =?utf-8?B?SVZPOGtHa09SYkp1azI4UzJUVWFxNncvaUY5RlZSNU5TQlc0MFRwRlRtajFv?=
 =?utf-8?B?VXRybm5yaFdaWGRMOUhIeHFkbHBDRmdzVkNnN3dnS0xZbkhWbFpUR01LN3Rz?=
 =?utf-8?B?SjA5UlRkM2ZKaVRNTVRPbmRkODdPWlVkUTVnQTlycHNoY2dtNTFDQ2ZEL3Nz?=
 =?utf-8?B?V3l2cWJyVWZNNW8yUW1WVEp6OEx1dyt5d3l0QzI4bjc5TzNacWVSS3EybFB4?=
 =?utf-8?B?ME0xZUdLWDZsK0ppb2MyZ2VrS3M1dlpENWZ4RU9KY3Nmem04NUlFdGsvYW9E?=
 =?utf-8?B?NittcjN1SmxmWjdEd0dkTFlvdmFpdkdHUEhzOWpoSGxoVzJHZmxYY3pvOFhu?=
 =?utf-8?B?T2FsNDg0andtaHhBWFpJYWZSVGpXWTlWNWg1Z0oxNFFUVVI5K3BBb2FJa0ZS?=
 =?utf-8?B?Mmo1bWJ5VjZUZHdBM1pjb3FwY2NtUnhmRnR6RzUyU1N2b0l5Qm51RzZQd1Vz?=
 =?utf-8?B?emJPZUxGSUgrblFpVEJjWkpFZE83bTh6Zi9WMFFNQ3VlV2hpMEV1L3g5MS9u?=
 =?utf-8?B?OWhCTDZJUjdxbkRjcTEzTmJRK1FvY0dqWTFoRFQ3SzJ4cHlrTkc5WWF2MTJT?=
 =?utf-8?B?aHNYNmN4djM4MHdzZ1p5aXhBQ0ZaMFpIaGVmS0FhcVJDb1RHdWJSWnQ4OEYy?=
 =?utf-8?B?MnNxcXJ3SHZNV0RhTnZYZHprS2x5V3YwUTZlSVE5QS9Icmc5REFvZ3I1TDJt?=
 =?utf-8?B?dmZPY05aSFYxS04rTGovK1pQQ1ZBRlBvRG1xU1NyUEVPT3dtQmYxc1BKbTcy?=
 =?utf-8?B?UW5RREF5cFZhVlF6MGxiODlJSS9EVnhXc0FnY04xbkFIajhudWZGUzJIOVQ2?=
 =?utf-8?B?QTZCQ3pPNW50dEFUcmxkbkhQd21GVTRxM01hSnN4ejVSeTlsMnVabjlmdEd2?=
 =?utf-8?B?d1Nqb25CWVNEWDcyR3Z0R3ZwSWdnbWltL0VKZnQ4T201YjJNVlZzamhZQXZS?=
 =?utf-8?B?QVBoa3dxMnpiWnBwMld0SU01em9lUEhRT2puQndjZGI5TVFjVWtoaTlub0s3?=
 =?utf-8?B?N3dOYnYvNDRqYUVrZ0llUDBqM3I2ME1rYmloZ1pOcW1neFJOa1BIa1kvTnc2?=
 =?utf-8?B?VDZhOUVCUVh1eGdJQkJ3dkppTVFTSEF5alNLQXYyRlAxMmRya1M5b0hlSDV5?=
 =?utf-8?B?RWtOaHFJNWxyRUhTWHRsQkRBL2VVUjE3VWg5dmlOd1c0Wm9oblhqb3Bxb2xV?=
 =?utf-8?B?TXd3UGs1MC9BU3dtUDc4STg4djhIbGkzZng3V1BqMlMxT2ZsdStQU2Z2OWZs?=
 =?utf-8?B?NHlVV0IwcHpDNGFzdVNUZFdIOUQ1QlErUHdET1pzZyt5azhaMThpWTgzQjln?=
 =?utf-8?Q?A2W8JG99ajGCczDA=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_03802B3E-EEA0-4C22-99C1-23D0DD9F3FC1";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c560b9de-e001-4cdb-99bf-08da509b32c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2022 19:54:32.7947
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2DgxksVEI8rJ6Cz8JuVPIB0FFu1l9jNH6ium92OJQjf7vDKzLQi2Mx2Jw+lStc+MuBF1rJ0P6CVYEG2hT+7JLm2itinFxCwJCwphiwE6wrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5703

--Apple-Mail=_03802B3E-EEA0-4C22-99C1-23D0DD9F3FC1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 17 May 2022, at 15:33, Matias Ezequiel Vara Larsen =
<matiasevara@gmail.com> wrote:
>=20
> Hello all,
>=20
> The purpose of this RFC is to get feedback about a new acquire =
resource that
> exposes vcpu statistics for a given domain. The current mechanism to =
get those
> statistics is by querying the hypervisor. This mechanism relies on a =
hypercall
> and holds the domctl spinlock during its execution. When a pv tool =
like xcp-rrdd
> periodically samples these counters, it ends up affecting other paths =
that share
> that spinlock. By using acquire resources, the pv tool only requires a =
few
> hypercalls to set the shared memory region and samples are got without =
issuing
> any other hypercall. The original idea has been suggested by Andrew =
Cooper to
> which I have been discussing about how to implement the current PoC. =
You can
> find the RFC patch series at [1]. The series is rebased on top of =
stable-4.15.
>=20
> I am currently a bit blocked on 1) what to expose and 2) how to expose =
it. For
> 1), I decided to expose what xcp-rrdd is querying, e.g., =
XEN_DOMCTL_getvcpuinfo.
> More precisely, xcp-rrd gets runstate.time[RUNSTATE_running]. This is =
a uint64_t
> counter. However, the time spent in other states may be interesting =
too.
> Regarding 2), I am not sure if simply using an array of uint64_t is =
enough or if
> a different interface should be exposed. The remaining question is =
when to get
> new values. For the moment, I am updating this counter during
> vcpu_runstate_change().
>=20
> The current series includes a simple pv tool that shows how this new =
interface is
> used. This tool maps the counter and periodically samples it.
>=20
> Any feedback/help would be appreciated.

Hey Matias,

Sorry it=E2=80=99s taken so long to get back to you.  My day-to-day job =
has shifted away from technical things to community management; this has =
been on my radar but I never made time to dig into it.

There are some missing details I=E2=80=99ve had to try to piece together =
about the situation, so let me sketch things out a bit further and see =
if I understand the situation:

* xcp-rrd currently wants (at minimum) to record =
runstate.time[RUNSTATE_running] for each vcpu.  Currently that means =
calling XEN_DOMCTL_getvcpuinfo, which has to hold a single global =
domctl_lock (!) for the entire hypercall; and of course must be iterated =
over every vcpu in the system for every update.

* VCPUOP_get_runstate_info copies out a vcpu_runstate_info struct, which =
contains information on the other runstates.  Additionally, =
VCPUOP_register_runstate_memory_area already does something similar to =
what you want: it passes a virtual address to Xen, which Xen maps, and =
copies information about the various vcpus into (in =
update_runstate_area()).

* However, the above assumes a domain of =E2=80=9Ccurrent->domain=E2=80=9D=
: That is a domain can call VCPUOP_get_runstate_info on one of its own =
vcpus, but dom0 cannot call it to get information about the vcpus of =
other domains.

* Additionally, VCPUOP_register_runstate_memory_area registers by =
*virtual address*; this is actually problematic even for guest kernels =
looking at their own vcpus; but would be completely inappropriate for a =
dom0 userspace application, which is what you=E2=80=99re looking at.

Your solution is to expose things via the xenforeignmemory interface =
instead, modelled after the vmtrace_buf functionality.

Does that all sound right?

I think at a high level that=E2=80=99s probably the right way to go.

As you say, my default would be to expose similar information as =
VCPUOP_get_runstate_info.  I=E2=80=99d even consider just using =
vcpu_runstate_info_t.

The other option would be to try to make the page a more general =
=E2=80=9Cforeign vcpu info=E2=80=9D page, which we could expand with =
more information as we find it useful.

In this patch, you=E2=80=99re allocating 4k *per vcpu on the entire =
system* to hold a single 64-bit value; even if you decide to use =
vcpu_runstate_info_t, there=E2=80=99s still quite a large wastage.  =
Would it make sense rather to have this pass back an array of MFNs =
designed to be mapped contiguously, with the vcpus listed as an array? =
This seems to be what XENMEM_resource_ioreq_server does.

The advantage of making the structure extensible is that we wouldn=E2=80=99=
t need to add another interface, and potentially another full page, if =
we wanted to add more functionality that we wanted to export.  On the =
other hand, every new functionality that we add may require adding code =
to copy things into it; making it so that such code is added bit by bit =
as it=E2=80=99s requested might be better.

I have some more comments I=E2=80=99ll give on the 1/2 patch.

 -George






>=20
> Thanks, Matias.
>=20
> [1] https://github.com/MatiasVara/xen/tree/feature_stats
>=20
> Matias Ezequiel Vara Larsen (2):
>  xen/memory : Add stats_table resource type
>  tools/misc: Add xen-stats tool
>=20
> tools/misc/Makefile         |  5 +++
> tools/misc/xen-stats.c      | 83 +++++++++++++++++++++++++++++++++++++
> xen/common/domain.c         | 42 +++++++++++++++++++
> xen/common/memory.c         | 29 +++++++++++++
> xen/common/sched/core.c     |  5 +++
> xen/include/public/memory.h |  1 +
> xen/include/xen/sched.h     |  5 +++
> 7 files changed, 170 insertions(+)
> create mode 100644 tools/misc/xen-stats.c
>=20
> --
> 2.25.1
>=20


--Apple-Mail=_03802B3E-EEA0-4C22-99C1-23D0DD9F3FC1
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmKs2/AACgkQshXHp8eE
G+1BHgf9FLZncxfDyyUCcd6iZqcG+/Hse/3pjRVdO425HQHuVzrsxfQ684mDHCN/
0VnNIhK413ME0Ih4npbyLI/xAQsKMiVZwntEfm0ndGXI9mKcn38njE5C64L/pnkV
w5zbDql+FXzWqzSNUrgtCPa35f2wc9nPQ2FrQBpQr+0dIPHqBZvefPNY83/toIqp
Z1zfqnG5hDwZAZg96jpTdZJbM9Mo6KFWN4LmIGiXm4yBRa2dow2Kyb+0OPFTscpl
VVyoN27Xww9hS7Up1Erc9EC4I0oTQXBV7Qmyz4zvVKobM0PpoeGr5bj63dkT3mP9
37pJa5rcp7jEAPIsOdN5ar0dSQ8Cgg==
=puLY
-----END PGP SIGNATURE-----

--Apple-Mail=_03802B3E-EEA0-4C22-99C1-23D0DD9F3FC1--

