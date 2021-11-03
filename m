Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01075444044
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 12:01:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220783.382179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miE15-0000ux-HA; Wed, 03 Nov 2021 11:01:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220783.382179; Wed, 03 Nov 2021 11:01:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miE15-0000rz-E5; Wed, 03 Nov 2021 11:01:15 +0000
Received: by outflank-mailman (input) for mailman id 220783;
 Wed, 03 Nov 2021 11:01:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4+yV=PW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1miE14-0000rt-26
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 11:01:14 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b88bf196-a658-4b09-ac43-b4bba8c323f6;
 Wed, 03 Nov 2021 11:01:11 +0000 (UTC)
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
X-Inumbo-ID: b88bf196-a658-4b09-ac43-b4bba8c323f6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635937271;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=mCTCFVggNgxdSMODB8CzOlnJ0cnC8L3Xj4UrcfAv7As=;
  b=KdhY8gLpTbfZtahvW9+dIkyjSjavRUWH2EhLzmUVUUr2qXYMcfU7FqWE
   FGUK1eApznXASPS3Is4JUAUjB8nw1MRSj7Jp8IKugpE/EKr3EvFT//dA6
   VoganZpb94CcGvOjaTScT9of9xmQ1EG4mumr5XOwv11FpZM74Kjh14PwV
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: szyDQem35qOHb/T/xogJx2jqi2Ou31RGujm2iGbkKpY994IrX5h/rHBTRJkI+TZSMqi0lHo2A8
 KDcdMzSJdoAyIDadvaXVZTFVqcEik0nkDv+izDAX35HTJ9u9M4R8AOGPVM9lPfGCVlS1lktzwv
 kFZQwXS89h2dTfCu1RLfyXJ3vDLQAHE3A53V9gNXnANRaiqC4s/F/HUTTtcWNd1mb47dQ845Y9
 p8ma7fHMrGIzHVwzp5GzU2lDo+Lsm4+ZoM4qwyniFIdZg51R+Q17WKBUanS4mWfLzq6L5lhSlp
 zSp5F6kzsKt3or+VcatDbLQZ
X-SBRS: 5.1
X-MesageID: 57355765
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4+rToqlHjSIByVGvZIfeawXo5gy+IERdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXC2mPM/yMZzOhedpza47l9kJX7cKAnNU3Ggs//i8yQyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg29Yz2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PZRhZGNcQwUBbHRl/UAYUB/UDs9epQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Gpv3Z0TQqiDD
 yYfQRQ3Zx/tQzpmAE9JEYsbxujvpCLZQiIN/Tp5ooJoujOOnWSdyoPFGcDJd9m9YNRal0eVu
 ErL5238RBodMbS39z2B9X69g/7VqgnyUokSCb6Q++ZjhRuYwWl7IBcbT0ehqP+1zEu3QctCK
 lc88zAr66M18SSDS9j2XxS85nmerBMYc9NKFqsx7wTl4rDd4xudQHMFSDFBQNU8sYk9QjlC/
 niNktDyDDpjqoqpWGmd/beZqzC1ESUNJGpEbigBJSMH6dT+pIA4jjrUU81uVqWyi7XdPjX9w
 CuDqiQksJwVgdQWzKWw/V3BgDWEq4DAS0g+4QC/dnKo6EZ1aZCoY6Ss6EPH9rBQIYCBVF6Ds
 XMY3c+E44gmFoqRnSaAROEMGrCB5PufNjDYx1l1EPEJ9Smp+nOlVZBd5nd5PkgBDyofUWa3O
 gmJ41oXvcINeivxBUNqX26vI+c2/aXdLd/YbezJYctTUMFWNxXEuxg7MCZ8wFvRuEQrlKg+P
 7KSfsCtEWsWBMxb8damewsO+eR1n35jnAs/Ubi+lk36iuTGOBZ5XJ9caAPWBt3V+p9ot+k8H
 zx3E8KRgytSX+TlCsU82d5CdAtaRZTX6H2fliC2SgJhClY5cI3CI6WIqV/ER2CDt/4L/gsv1
 ivsMnK0MHKl2RX6xf+2Qn5icqjzep10sGg2OychVX7xhSN+Mdn/sv9FK8toFVXCyACF5aQqJ
 xXiU57Yasmjtxydo2hNBXUDhNU6HPhUue5+F3X8O2VuF3KRbwfI5sXlbmPSGNomVUKKWT8Fi
 +T4jGvzGMNbLyw7VZq+QK//njuZ4ClG8MovDhSgHzWmUBi1mKBwNTfLh+M6S+lVb02rKs2yj
 F3NX3/1ZIDl/ucIzTU+rfvY9NzxQ7clRRcy8quyxe/eCBQ2N1GLmOdoeO2JYSrcRCXz/qCjb
 v9S1PbyLLsMm1Mijma2O+8DIXsW64S9qrlE4B5jGXmXPV2nBqk5eiuN3NVVt70Lzbhc4FPkV
 kWK89hcGLOIJMK6TwJBeFt7NryOhaMOhz3fzfUpO0GmtiV5y6WKDBdJNB6WhS0DcLYsaNE5w
 f0ssdI94hCkjkZ4Kc6Piy1ZrjzeLnEJX6g9mIsdBYvn1lgixl1YOMSOAS7q+pCfLd5LNxByc
 DOTgaPDgZVax1bDLCVvRSScg7IFiM1X6h5QzVIEK1CYofb/h6c6jE9L7DA6bgVJ1REbgeh9D
 Xdmah9uLqKU8jY22MUaBzKwGxtMDQGy81Dqzwdbj3XQSkSlWzCfLGA5PurRrkkV/3gFI2pe9
 bCcjm3kTSzrbIf62S5rARxprPnqTNpQ8AzemZ/4Q5TZTsdiOTe10LWzYWcoqgf8BZJjjULKk
 uBm4eJsZPCpLiUXuaA6V9GX2Ll4pMpo/4CerSWNJJ80IFw=
IronPort-HdrOrdr: A9a23:e75WEaOMsFthWMBcT1v155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/uxoHJPwO080kqQFnLX5XI3SJzUO3VHHEGgM1/qB/9SNIVyaygcZ79
 YdT0EcMqyAMbEZt7eC3ODQKb9Jq7PmgcPY9ds2jU0dNT2CA5sQkTuRYTzrdHGeKjM2YabQQ/
 Gnl7V6TnebCD4qR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPsf2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0aySwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7QvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WXAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 dT5fnnlbVrmG6hHjLkVjEF+q3oYp1zJGbIfqE6gL3U79AM90oJi3fxx6Qk7wE9HdwGOt55Dt
 //Q9ZVfYd1P7grhJJGdZQ8qPSMexnwqDL3QSqvyAfcZeo600ykke+C3Fxy3pDtRKA1
X-IronPort-AV: E=Sophos;i="5.87,205,1631592000"; 
   d="scan'208";a="57355765"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OpcxhSCfHw1mMOGpz1iX/MkAJAt9NPOdlDuGelG0HBbtLl3YlxJkelEMe2UYvSxVfckggSS+19CTX5L+VYQ5ct6GlFokD6bqQdxujx/jXT5VhvTreHcOvU9/JaOna5xKk4RtMV4nEgM0abqvVkP+iPSZwcuecWDMtU4hhV9NA1y0mi8DoojsJ6mmyc9htF0AQxbVrwIbwm/klc+eWq6Y8N3DwPk3cAV18p5VUhoh2OOlnSBLouj9Vm1LdTurbMeSowrO2D0Hc5lj0cPSUW0Ub6u3y2h0YbzSdwZSuKgwZXNhEX+Ps2eWo4SAasGfjuAV1eD2c3SaqDMTytCXDd8tfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nufGc9BLzFfdeaVHW1Je3NvSwxZPZFL7GA/6Q7+cfPo=;
 b=W5R2djPLP5AiHf3oNt8yu19t3qKoWXVlxF9qHL1pdulEoUsdvQrJUQgj/BAk2my2zeZQ0kA8auDO5iHf4hzHSSSCpQR5lVF7DTnLzrkuxAsl+P6ofAdrpNdh+hRLckm0cOzWnnBxE4UvG80Y3GBz1x1TBjBYOzXdo5BCrZak9FTKBpqJyomZi/zFo5CWtr4AM8HTEZj+dr1M4/r9ZlZI8wNaDjFgq7TQP16Pue7dglLROSypPdWOeOnm9eOcwiUiMC3I5R4zPTDiV+IKM5SwzaXdTiZDxsVU17S7rW1BAP6bYdSKClEXT7G3/OgWEhHEhYLQ9ir31MYCDnGGktv17Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nufGc9BLzFfdeaVHW1Je3NvSwxZPZFL7GA/6Q7+cfPo=;
 b=ExK/+jFQmDD41WRnWeNIFPqvNfJ6TPDlOomn5VWczE2rPXFSHv8FQ3lP8xxwsmwUAWsxSiRUUiB6sdJKSHuw9UMc/OtdwxV4BykFRjDLGxNrkoAi+TSc7h0/cwGCbumcGE/UkoYmZmSH4Dz1P+4Mc9fJ7ajEKmxxrCrnvXP7138=
Date: Wed, 3 Nov 2021 12:01:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "julien@xen.org" <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, Michal Orzel <michal.orzel@arm.com>
Subject: Re: [PATCH v3 08/11] vpci/header: Emulate PCI_COMMAND register for
 guests
Message-ID: <YYJr75RbSOuvbzGF@Air-de-Roger>
References: <65e218f1-471e-fd02-441a-f8c5f29d776e@epam.com>
 <b7626958-4df3-9f07-0ab9-604e55b3274e@epam.com>
 <de320822-a94f-18ad-ccd4-574037903b1c@suse.com>
 <46826bb3-472e-e88b-5421-20fdaf5b49cf@epam.com>
 <a5ff1c9b-3200-18f0-a373-7535980269cb@suse.com>
 <4d4a061f-6437-5d51-84e0-d2139f47eb76@epam.com>
 <4f77a4f2-a66b-465d-5859-7fe71ece8168@suse.com>
 <48506e1b-2dc9-4652-f169-3d44135a4e74@epam.com>
 <7efa4dd7-83b3-daac-cc02-86f80762513b@suse.com>
 <d3908703-3501-892c-55fc-5a171318eeea@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3908703-3501-892c-55fc-5a171318eeea@epam.com>
X-ClientProxiedBy: MR2P264CA0178.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::17)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4555bc5c-539f-4289-f9e8-08d99eb93cf2
X-MS-TrafficTypeDiagnostic: DM5PR03MB2633:
X-Microsoft-Antispam-PRVS: <DM5PR03MB26331C507E0FCBFBA547A7248F8C9@DM5PR03MB2633.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U0M7raEaf4JHwnsZW9QVIIonVbj14s68fc15mc6BzlvnJ7Q/6lL3vSsK4thPilNN3qlpXy2LstT3Dr8u4c7nf43HvrDbl2MrAGKaWxG23tv43X+R1YtW474eCq1KIa515ek3Qnff0GHrUcDYUj4q7SK/Kw0iwbbV50uWN4Lq9SsJrd91YwuSIgXxrBM7TWIVzQo7/f9rOx4MQc+4PCG02RzOheLWPTOzBrcmxcc8KsPlL0LpJvxxYfiDXpVWtAUH0cpoEN4NU3cgIXAo/FzC+bR+a6Jo9WJ9h3vEOhFs1GgsBFQCxXk7cqoVQW5WczqvReryaMvv43MSQAC1JgtK4z3fh0LKU+B9WlbRvqYdOQF0sZcXg7Z3SxyVtQfKdYxuYg1sODjZmrTPxz4LMVjxbT40fiG9N9HYKKXr1z3cHtnjWtxkqEZwguGdKHbasRa9InmFnqZxGdI9Tht25gzJRk79ZUvY8nWvgXdoyabXnryd05I8VLxbyVRYjf29wDlXDIrG7XiVUhoYAc79lMzVfWNWmzvzV4QL2gQQ8LHkY71wsqyH7Nskvba+H9oaI6YFH0m9Y82vmV+IC6KZ+ZdwpJMvPr3lgeiLiS+xBPeeKz7O2+EoHybbBIeTZlFlzq5EL5oL2+Br0AOVxFag2ojiCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(38100700002)(86362001)(53546011)(956004)(2906002)(6666004)(316002)(7416002)(54906003)(508600001)(66476007)(6916009)(82960400001)(5660300002)(9686003)(26005)(186003)(85182001)(4326008)(33716001)(8676002)(6496006)(8936002)(66556008)(6486002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTB5eHJCRmtqWmpsWGIyY0xZUVg3bDVMREFPYTA2QkwwOEg2MXI4dWRPT0Vp?=
 =?utf-8?B?enNYb0c1SEN0bDFBS0pYVTEvRmw0dWNUUzdqa0dNNzRhOE9tSHF3cHF5bEFj?=
 =?utf-8?B?VUlyNko0VUVpaHdITVFWa21VUlRJcElEL1VQVFJydFZJcS8zcFA4MDRSMHI4?=
 =?utf-8?B?RE5SZWVRSXJrRHpkcXBZMFVZOWxJZ3lHM0VuNnJWNXBlT2dtQXM4czU1by9R?=
 =?utf-8?B?YjJ1K1V5YXZMOENmVFNCVHpkK09EZko5ZkhxWnhFcmNBdFg5bThRaVNaLzU1?=
 =?utf-8?B?cDh5Ukk2M3VEWjlyMENEWmVqamNxWlc1THRIWjBoRlZLOFZpb3lIdlBhcmFu?=
 =?utf-8?B?WkdCd09hKzFzT0IwWDVLdGhrS21ZdGRIbkhUSVA4UTd3U0lmMWJmWFJCNURo?=
 =?utf-8?B?alZnS0d4MmN6WDFLOFNmaGdrN29MMEpqV1kyZGorZ2lDNk9CaUROSm1ZMXZn?=
 =?utf-8?B?cElkV0JlaElSL1ljdVg0bWswcUpVUXJHeWFON0JHbmpBdlFaU1cwcTNzNmJu?=
 =?utf-8?B?cS9JcThpcXZFYlVxVW5RUlZ5WmR6emxjLzRIb0RuVHdCbStTQUI4ajhkUnFQ?=
 =?utf-8?B?b3lyQktnOUMzaDhDdDhpTjFIYmpMK05XbkQyWGVETkNzaHpJcWMvVjZWdGZJ?=
 =?utf-8?B?UmRqODJtT3kwVXZ1MEdQS2ZWMnJqUksxUUpjc0lHZ2padWI4ejZyeVEyQUVh?=
 =?utf-8?B?ZDJtVWsxbHUwZ2hvRHJYY0J5RVpmVmdGZnFXRWhESE00R1JyVFR0dHhNVFRa?=
 =?utf-8?B?V3FrNTdZOG1CVzNTWFkyOHIyUkpIRmJzQmowQ0xGUTExVE82TUhTbkxKNGFz?=
 =?utf-8?B?MVlRNVNIUURlbHFZaVhQaUg3VStXbXJxQmxrS0FSVTBOcmpRaVFodWhPUmdL?=
 =?utf-8?B?Lzk4RDIzUU9aMnlaVDZ6YWRCZWI1NXZOUUhTdXJOQXFuTzRNaFNvUU1yQ1Uy?=
 =?utf-8?B?YURBbW5PbER1MVRZT3I5UFpWb2NuZ213ZzJjdFFjV3puR0tCbEdsMnZRMXZQ?=
 =?utf-8?B?NkdpblRIVU9pcEhNbjRnRW1rMlFxbDN4T0hhM3BJVVVycDNCaWF5VlJQZzRV?=
 =?utf-8?B?R2IvbzM3Z1BIdUdCdXZJaXV0SnRoaFBMVmZVYURmUkhUT2FYRFhWZEI2YW1W?=
 =?utf-8?B?UEN1V1pMcDNEN1hCeTYxSlRuTkRVQ1FBWFl6Q0hTUnpYblRzVFFkZk45Titz?=
 =?utf-8?B?dHNPUmlHOFJSWjdiMURBVnRaZHcwN1lObHQ3ZkU3Kzk1Qkp6Zi9tbzZ3QkN0?=
 =?utf-8?B?MElCWGNwOTd1UkVjME5kY0NES09lOUcvZ09pL2pGRnFaQS85b3B0REk3TFlJ?=
 =?utf-8?B?RTlOaFJUNjFrNis2RTNmOEgxWTFFT21VMWlBRW5zU3V5NysyYTVMTFFJdFlk?=
 =?utf-8?B?WFlsRlh6bnQ1eEk3NmVGbE5nOUFMVFhoRGJpT3RGYVI1VHhmdVY4blRNWjFX?=
 =?utf-8?B?Y1lLN1hlSWpCSWNrVjk2cFAzanY3NVozZy8zMDN0VWR4VVgvL2dSeVNtT2Y4?=
 =?utf-8?B?UnB0eFB1andNTTdnbm1zQU82aEJvWG9TR25JUjcvT0FlZ3RTVjZ1bTJ5bEVs?=
 =?utf-8?B?UStaQzFQam1HNzREYmp5a1FBdnltN3VHWStjSytPbWoxRHgrMVJVTkxsUTha?=
 =?utf-8?B?U0RaODFBOXp4dHdEUmE4MVYvNWl5OWE5ZEp6ZEVKMHZkc2ZSV1Uwc3Y0RzQ0?=
 =?utf-8?B?d3JJZEg5L3NnemJOeVV1OWZLNFFBOXNFdHowMXFxN0t6eEdOQTMyTDZMd1BP?=
 =?utf-8?B?Snl3Z2xmeWIyRTd0WDRQb0RhTlJRR3JwWlR1R09CNk1UUjE2MjQ0QldOanBL?=
 =?utf-8?B?V3ZtSFdFS1ErMnFoTVBmcWF6ZWNGZnAyNFZkaDNKdElZcndlYi9pdi9qeXg4?=
 =?utf-8?B?c0kvZkhiTlhoTERsTWpEUXFDWEJuTG5HZzhzNldyR25xdGlpaGQ0Z09DSDhi?=
 =?utf-8?B?OG1OZ2svd2VZTnkrUzJDbkdYV3Fwd1RoclVsRUw3bmlrR2thYWFlaWZMV2xy?=
 =?utf-8?B?bGxlWlZQQlJucmpGT3lnbGZJQjNBS3JZVTMyU0JrR3pSMGk1S0Zuc3hNWDhG?=
 =?utf-8?B?VC9KKzZoV1hpYTRSS0p0b2tkdFBDSEx4by9CVGJ3R3MxbzRvTHArenRoT044?=
 =?utf-8?B?WkFSZjlobUlUeHpobkh0amJQTnErbGtRQTlMZmVvVVFnYmp3VHJsd2txaWxq?=
 =?utf-8?Q?uQi2Q9eFv833On0m6mUYLkg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4555bc5c-539f-4289-f9e8-08d99eb93cf2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 11:01:08.1009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B/R1UWfsYXC4dPc3Dm+NL4Z9WB2t5bXLDBMDgGKiqKmQMBKQWsrQL1368iDySQtTRrSlMnykN5eeB34PItQKMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2633
X-OriginatorOrg: citrix.com

On Wed, Nov 03, 2021 at 10:36:36AM +0000, Oleksandr Andrushchenko wrote:
> 
> 
> On 03.11.21 12:34, Jan Beulich wrote:
> > On 03.11.2021 11:24, Oleksandr Andrushchenko wrote:
> >> On 03.11.21 11:49, Jan Beulich wrote:
> >>> Aiui you want to prevent the guest from clearing the bit if either
> >>> MSI or MSI-X are in use. Symmetrically, when the guest enables MSI
> >>> or MSI-X, you will want to force the bit set (which may well be in
> >>> a separate, future patch).
> >> static uint32_t emulate_cmd_reg(const struct pci_dev *pdev, uint32_t cmd)
> >> {
> >>       /* TODO: Add proper emulation for all bits of the command register. */
> >>
> >>       if ( (cmd & PCI_COMMAND_INTX_DISABLE) == 0 )
> >>       {
> >>           /* Guest wants to enable INTx. It can't be enabled if MSI/MSI-X enabled. */
> >> #ifdef CONFIG_HAS_PCI_MSI
> >>           if ( pdev->vpci->msi->enabled )
> >>               cmd |= PCI_COMMAND_INTX_DISABLE;
> >> #endif
> >>       }
> >>
> >>       return cmd;
> >> }
> >>
> >> Is this what you mean?
> > Something along these lines, yes. I'd omit the outer if() for clarity /
> > brevity.
> Sure, thank you!
> @Roger are you ok with this approach?

Sure, I would even do:

#ifdef CONFIG_HAS_PCI_MSI
if ( !(cmd & PCI_COMMAND_INTX_DISABLE) && pdev->vpci->msi->enabled )
{
    /* Guest wants to enable INTx. It can't be enabled if MSI/MSI-X enabled. */
    cmd |= PCI_COMMAND_INTX_DISABLE;
}
#endif

There's no need for the outer check if there's no support for MSI.

Thanks, Roger.

