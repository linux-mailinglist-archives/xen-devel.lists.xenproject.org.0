Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E58A363C973
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 21:37:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449614.706475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p07Lv-0002CK-Ps; Tue, 29 Nov 2022 20:37:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449614.706475; Tue, 29 Nov 2022 20:37:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p07Lv-0002AA-Lh; Tue, 29 Nov 2022 20:37:15 +0000
Received: by outflank-mailman (input) for mailman id 449614;
 Tue, 29 Nov 2022 20:37:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xNwm=35=citrix.com=prvs=3259bd577=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p07Lt-00029b-EG
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 20:37:13 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 984df6cc-7025-11ed-8fd2-01056ac49cbb;
 Tue, 29 Nov 2022 21:37:11 +0100 (CET)
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Nov 2022 15:37:08 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6707.namprd03.prod.outlook.com (2603:10b6:510:112::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 20:37:06 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 20:37:06 +0000
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
X-Inumbo-ID: 984df6cc-7025-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669754231;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=bDxCvA9XjZ5o06K2B75AnszirJXU/O38c/CsMBuH8KM=;
  b=Cp2hPsWm6XsZwfhveY//1cBiHtijQWx8tIN+20uzMiOdMBZFgxWq8tG5
   NTl/aixtjI5jpydbWpV3x7z5/ZGkoD3rhtcAouBUwp/WA2I3JGfGhVmx1
   4nVS3OPbhas+8x8jvCZ7Q/kK1J9uI1PzW/9cD25B34rpWrw7BO74Cd9vd
   w=;
X-IronPort-RemoteIP: 104.47.59.174
X-IronPort-MID: 86224706
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:xZ0JXa3xcXwWD+6O0/bD5fFwkn2cJEfYwER7XKvMYLTBsI5bp2MHm
 2EcD2uDOa6NM2Chet91b9yw9h8GvJbdmNBjSFQ+pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wVkNKgV1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfMEVKz
 r8mFBE0aiup19nxzu6cVLY2v5F2RCXrFNt3VnBI6xj8VKxjbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqsi6Kk1AZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXOlAthOS+XmnhJsqGOY514RCx8xbkaYoMGmjUXkfvNZB
 FNBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9Vna15rqS6zSoNkAowXQqYCYFSU4J5oflqYRq1BbXFI88TOiyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAsjA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:rQIFn66EbUykzPgb8wPXweCCI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qeu1z+853WBjB8bZYOCAghrlEGgC1/qp/9SEIUHDH4FmpM
 BdmsRFaeEYSGIK9foSgzPIXOrIouP3lpxA7N22pxgCcegpUdAY0+4TMHf4LqQCfngjOXNPLu
 v42iMonVqdUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpixBiSgSiu4LvaFQHd+hsFSTtAzZor7G
 CAymXCl+SemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQBiTwhh2ubIFBXaTHmDwuuumg5Hsjjd
 GJiRY9OMZY7W/XYwiO0FXQ8jil9Axrx27pyFeej3emi9f+XigGB81Igp8cWgfF6mI71esMk5
 5j7ia8jd56HBnAlCPy65zjTBdxjHe5pnIkjKo6k2Ffa40Dc7VcxLZvvn+9Ua1wWR4S2rpXV9
 WGP/usosq+tmnqNkwxi1MfhOBEmE5DRituDHJy4fB9mAIm4UyRh3FouPD32E1wtK7VAqM0md
 gteM5T5c5zZ95TYqRnCOgbR8yrTmTLXBLXKWqXZU/qDacdJhv22tfKCZgOlZaXkaYzve0PsY
 WEVEkduX85ekroB8HL1JpX8grVSGH4WTj20MlR65Vwp7W5HdPQQGa+YUFrl9Hlr+QUA8XdVf
 r2MJVKA+X7JW+rHYpSxQXxV5RbNHFbWswIvdQwXU6Iv6vwW8XXn/2edOyWKKvmED4iVG+6Cn
 wfXCLrLMEF9UyvUm+QummkZ5osQD2LwXtdKtmowwFI8vl9CmRliHlktX2poseWNDZFrqs6OE
 NjPbKPqNLImVWL
X-IronPort-AV: E=Sophos;i="5.96,204,1665460800"; 
   d="scan'208";a="86224706"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UjcWyQQUZenznn/phKAuySi/Ptg53WXXb6WCnq7Mz0cf5jLMFU3Yx+gX+MVZlYqgsMAn+ifLjU/svBRyqjobv/B4WJlENvKJzr+qaNkOXmBao6c8ET+gCMRoV4deqmF4d3tvQqHK6s0leEZc6MWxwLfwY51ultZI9c8qs4Oz8Z6Iw0n6sk7F9w5pnimUlXlrlPVPOfuEmGDAMUqiCN9Mk/N7m2Pcfiu2qlh/1gU8YU2q/DbdsRtf3leFzyBZB9U9RXGECsPPdhCBVqu09O7AxhoJt1eO+Z/ONZJfwj3JpG2ZlgkdNnxSm3wvEoOHOg74SzcMDootTCYHulx6/cma/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDxCvA9XjZ5o06K2B75AnszirJXU/O38c/CsMBuH8KM=;
 b=BAovEXU+VmO1TUs0WIBnk3QM89oxkzihSRWIXMx82LneJL86jja4ostXcEHwHyDToZHbsR2HhmfBablqFF1CwbtVCiu6+Amqeo3Qr2nUR0TmMVcBkK3qjZwlFer/21+0eqd6407Rzi62O06k0fedFvFy5LDsU86WlnRDKRGHqJa/+pFq9pFZyUsQNNDFL1tpFKKK4EfSJmDhJmy6vAOgJZu19GIrDIkRtetDEMQtsYcQhtC6evH6R16lsuGsAJWLkXiBCaAdk3c33XEu/OAJsPZOewlsGItrUrJqueM5hFHcrz81ldKFNu2yPyXTKz9om6UU5XQHnO2mfA5vSYlUZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDxCvA9XjZ5o06K2B75AnszirJXU/O38c/CsMBuH8KM=;
 b=WHtTKqrzVxzVt3FRMoQueeJhIIHq5I/fahwnX/jIXXNuGTGx9rEYgYb7C3FUIdOn1UFcSz0hZssEs0tHYBNwsb6wiFAISbYN4s+UF5xseQU0kvAPtIvTsnlo6GX+g3WGzTqaADB2s7AY3gUrwYVwAg6WzT9gRbyI6ZPz/QXDzyA=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/MSR: use latched "current"
Thread-Topic: [PATCH] x86/MSR: use latched "current"
Thread-Index: AQHZBAHfUTfAg3OK4U608Se22l8Hja5WXKwA
Date: Tue, 29 Nov 2022 20:37:06 +0000
Message-ID: <fcbac509-09e8-0a3b-8572-dd2ec82f902e@citrix.com>
References: <d26b6ce0-3abb-2dac-282f-4ea5ed089950@suse.com>
In-Reply-To: <d26b6ce0-3abb-2dac-282f-4ea5ed089950@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|PH0PR03MB6707:EE_
x-ms-office365-filtering-correlation-id: ceeba72b-1c26-47a3-5e4b-08dad2497afa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 pED6DMKtsFQUtvI0Cv8TrAsg3kbVXmzBLu51JL8X8K2Xy2DoXRLtEuMU76yMjurWshL9tobUoKkK/0hV3H5E7Uwxe/pcw+qHTrSGS9ThGG92y/8hTcn9A74Wkh5V25nfrX+i5E4DABmzyhmdfelXkUfysja3DiY5L8dxsz/0lEPL//QWNZTWEyF3RlRfpnIpjpmOQXC2orDl6IJSG4ETBKdoIyetkPZNTaqOr5a2ngOgzWIpb4GKYglcv7v2ysY2+JELmMR7khio2lP/qAmUccO3iZX/T3ki+SYP0bCodcEIHXuwfDi5OfsT0TDP1KEUm27hQGiCY+A5DNG1nNRXRMRO+V8WmD6llONeVLd/JuIK8hiHF+4DZ2q5fXZ1y5Ga1lbXipXOlbqUY8RypM+cLnIbF5jjflEzGGlcbgw/QRgfPlA1dLyz5cPTURzEaE3MB/T3imi1T6JVHW57H5aI7EFR0D3G0BR53kM9lXQInMu3pzc1WB/e726XdZRdcEsGDuWHlt1fByccrr6fCArbpOgdX3vt32jx7V7koWC12jfGoqlaMENejywr/s5Edsw+ejweDbG7V13nYDNnTkk66Pl+jXWPsC1tNp+FOKBd1R1N8YmL3bxcQYmgq6FQK34z4A9fz7ELLaNMqJA+n/wKHipIWyfMp3JZdxlL2a5Lk9pgJ9Xv0fHN+sg0zddmFfUzCBhv4UygoFdAzqxiMjYGesS1caorBIBhokOXroh5vUaUIplrufUK/95wYfo2GLlwQQOSXS8lPPNGWqt+CV72GA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(451199015)(71200400001)(54906003)(66446008)(558084003)(110136005)(8676002)(8936002)(64756008)(4326008)(91956017)(36756003)(41300700001)(66476007)(5660300002)(316002)(66556008)(66946007)(76116006)(38100700002)(122000001)(82960400001)(38070700005)(86362001)(6486002)(478600001)(107886003)(53546011)(6512007)(6506007)(26005)(2616005)(186003)(31696002)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bXFBU0Z6TDMyQm9MY3AvdVNTYzZuZUhtWlFFbGp2MW1wUDZiQ2VMTFJ1TzlH?=
 =?utf-8?B?Si8zVnU1eUZER2huQjgrYVM4V3pwc01vSDlVOWR5TzgwNEpQZkxpdm9XZjho?=
 =?utf-8?B?QkJTelFMKzFqdXYrWFZNNitoOEgyNDA2UFU0Q3ZwazFoc3dGS0dob3BHWTZs?=
 =?utf-8?B?eEVHZ29iZllEMmZ1a3FqMk9SQk5wK2pPaGpuY3M0MmZOM1FLMlVRblBrdnlN?=
 =?utf-8?B?TWVpVW9odGlRTjJHcm53Y2FvdzcvU0xHSVRVVGg1UzR6azk4bytNVFVvakdJ?=
 =?utf-8?B?dnE0bGlkd3FVQjVzKzhibHhMZWZ6TUV2cEVhYnBYZDlvamZtV012UWFobk1Q?=
 =?utf-8?B?MmFraExqTkYvdnArZmhNVFptVkxKbkRBVkQyOGloMWR4dUcxMHV3NW9SMW5k?=
 =?utf-8?B?bGV1S1NLaTJ4TUpVakJxVDRIN2ZFR0NLdEJsaVZKMVl5Z0JiSlVsZU54OGdV?=
 =?utf-8?B?dnIxQVF4TWZJL2c2OFJodEtNaGtnLzlJMGRhcWFndm52dWFuN1BOZGRnS0dG?=
 =?utf-8?B?bzIyenk0TkVRRUhpQkdKc2tuN0ZabDZnWkRFMkFzaWQxOEJPT0ZHUXpZMUlq?=
 =?utf-8?B?cktTYk4yLy9oWkRJb2hPWHVXUjNyRlhSZitzSXd4eWo0akttV3NUdVdjYy9F?=
 =?utf-8?B?bE1iUjErVDBSM05CdmZKSnV2dDNQNVczcEpFcnlVMDQrNHhOa2Qrd2wxUHh3?=
 =?utf-8?B?em03MEY1ZlRFZXkzYmdYWWs4RW5VTndMaFBVNm9LeHlqNURKNVIramJsbVll?=
 =?utf-8?B?R2h2U0ZYV3dCZTRidHBxNHVIbnVhQUp3ajV4aFZxRXM3Vi9UOXU1RTFsVk9l?=
 =?utf-8?B?RStIWVNWdS80MjdJMExVaFo5YU8yY3pjZmZIMUJyclBYdDAzN3h6MEkrUWJH?=
 =?utf-8?B?ZGxJbFZ0ZzVMQ1VmeXAwY1ZHeC8wbytmbUtkbStaZ1Q5NVFObGFxM2dnRW1C?=
 =?utf-8?B?T3c4L0VEMGN6bkhPMjVMdjRSRGFVeEQzNTdYbVdGUTBJQmx6THBnM0V4NTlI?=
 =?utf-8?B?b2RKUnU2OEl0ZnlCTTdFMUpUYm03OHNWYWk0SDdBSXNVdVJjay9yK243QW1B?=
 =?utf-8?B?NGk5RXo1aGMzRW5IOVlLZjRuZEJtYjZwVWJqK3YwZHBEK2RiNzhXRHlKV1ZY?=
 =?utf-8?B?TnR4UGEvZ3A5bXkrZEpUMGVVelVBU2RIamI5ZDVLcUZQNGNVTkFWalgzRzlH?=
 =?utf-8?B?MG9zZFdQQUFZdUtDZmNSM3gzd0RreHdsWTJwVlBINkVhTVNHUnJEZ3o0alFC?=
 =?utf-8?B?QS9PdWhjbnpxN0JGMzdtVXlpMkxUQVhkM2pTTzNLYUdoNW1TQlpCZjlWTG1i?=
 =?utf-8?B?RmZBSVdsam14Y0pIcnNVTUJ3ZTcvK1dxNEdldTZCc3BiaWFjdHlFa2QrS2t0?=
 =?utf-8?B?UjlJeGdIU1dOZyt6aFliR2ZERHNQUEJtbHcwa0ZHdHhSK3dDSXgrWHZRU05E?=
 =?utf-8?B?MVBua0FhQmF1UEVscE4zWjI0b01zekUyMXB6RnFqdytEWEQ5bE52WE9kc05T?=
 =?utf-8?B?SXVCSDRHbXZibzB5VXU4TUk0Tm9pVHFFOWN2QXJkRC9zN3MxNkVSbUpKeFdE?=
 =?utf-8?B?allUd2VncStNOWZFbXJIU2pNYllzNmM5cTk0L3RjQjJzdnUyVkVuckFHRUhC?=
 =?utf-8?B?dWc2TzU3UUFPeXRjeW01aTFuZXpRYnVyUnM0WHNzMDZzK1NzRlRacUJMbmRt?=
 =?utf-8?B?b3VHOVUzTHkveGg1aERnOU1BVDRWY0RvZDZBMmFseWlESWpLbFJZZHIxLy9p?=
 =?utf-8?B?MVlGK0s5TjhBWDhmVitOREptVGdQelQ1RHlQODZiVDgybUlaM0EwdzhTRTV0?=
 =?utf-8?B?L2c2RjVFUUJEN2pzT3Ivek5XOWpGNGQ5QTdvY2tqVmcxTW5QUFpQdittWWgy?=
 =?utf-8?B?SElzRFBQQitoR3dWaUFIYkJNT1Fuaktnck1Yc2xmTEY1NXVLUTN2Z3UwZnhS?=
 =?utf-8?B?cjFoZ1VDeUY4SDdJRzcrMERSbytUWExVVThZVzVaL0V5bVUzS2x1NnJkeW96?=
 =?utf-8?B?SDZnak5EU3JpVS9RSitnWHJJSjZIQjBDRHhzOHBlR0M1NVFCeUlRZ2Q2Mlht?=
 =?utf-8?B?aGhJaHZMdGx5Q3c3K0o4RTFseGVQaE5DQWZ1R3J0Z3lXTHNRWHgwQjVnVnF5?=
 =?utf-8?Q?G/kKQvolrEpqkWlgVH6C0GzgI?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <482BB4205EE0C040AFEEA031A6100B9A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1/099edI7rXDt3N+EZAkeeJpy2rkTE9eKR/cZKYb8tYbVf44RpkwuSyqqc3T3BAKNeGweDsWsm66OLyvUhFisj44IZuvT61lmyxbPVQpDgwkhWjencSA5JuO/Av1nRaSjowOTzDxiQSckIJnU98Bim0gTi1qmhpw8xlNP7qKYzrNQnv8XWDBgjQ31L1Le+Yp/gxeJ/5hFMNmAT/S3nqnUBW+wiwb1159pFhmuMvdUJgsC/zIu7+zTn03y1tqoEIHGNvAeys0eOcVkKSGVur8QarURIA9RgDthEgMtuX3eM9Pg4y78yiWfmt2uF87fIz2lvoeI0DvKdz6g2fs3oqdlct6GG+tafqTFP177r/jJ7F44LSldLbCgiyCOKw2bQuEGLdL3iw1O4d3H8iAu4bWZ6+KIzLrHfGdgWqm9NY3mtfAHYD98BhVhph+19qMZja+TY/jjuEgR0S+setlk+56+1CkoThXchDWY8XwvEor24HVWMeVXPPbXqQxwpsJeCkJZHAaZRKNwdM4QR2tMAlBRn9iUHEQVbUUJsEhEp4B6uu7nNSMcjvi++Inl3WDOjpohcelOJ6palY/xf8fFWSgELUZeYP2yhUGt4GD4hQQFELkKRtla9bYunxaydPzlS00YeN4yfLIPhFtc2BCIQusq3NaOQgMu7koMZ2uPx3sKGUbHIOct4D2pBwge99JPbYUfXC/cIXbNIn5RlVoKpI3cKxBdGzXPvrDIt+0/vo+FlXwfCN+rCG3u9qmGJk7OXp+7WzQ19/mQgxsOF/IHlr6V0Yu8ilQKzzwkHh2QyVpwafDvNF2PSM3n20viU9gauHEKenbl9Os1eJMsGyoG3ePgw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceeba72b-1c26-47a3-5e4b-08dad2497afa
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2022 20:37:06.3395
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +VgivARiMED3uzULRZELwJOiwsWZl3bxF15WynyaaESAkddC12WMpuLZN4DXLKKzAHYOfhprKhaUsYJRibSs6BC+6VwEVD6eaepUUrNTYxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6707

T24gMjkvMTEvMjAyMiAxNDo0OSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFRoZXJlJ3Mgbm8gbmVl
ZCB0byByZWNhbGN1bGF0ZSAvIHJlZmV0Y2ggdGhlIHZhbHVlIGZyb20gdGhlIHN0YWNrDQo+IChw
b2ludGVyKS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPg0KDQpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4NCg==

