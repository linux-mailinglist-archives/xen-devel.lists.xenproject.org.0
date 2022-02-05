Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C844AAC9F
	for <lists+xen-devel@lfdr.de>; Sat,  5 Feb 2022 22:09:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266126.459810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGSJD-0003mA-Ek; Sat, 05 Feb 2022 21:09:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266126.459810; Sat, 05 Feb 2022 21:09:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGSJD-0003jw-BV; Sat, 05 Feb 2022 21:09:27 +0000
Received: by outflank-mailman (input) for mailman id 266126;
 Sat, 05 Feb 2022 21:09:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vIk1=SU=citrix.com=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nGSJB-0003jo-U5
 for xen-devel@lists.xenproject.org; Sat, 05 Feb 2022 21:09:25 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3b87fb2-86c7-11ec-8f75-fffcc8bd4f1a;
 Sat, 05 Feb 2022 22:09:23 +0100 (CET)
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
X-Inumbo-ID: e3b87fb2-86c7-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644095363;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=VThZqsP0hF+BBVqsQwoAOJ1CnDhBpeqvJqFOhAvnfOc=;
  b=ZW+QE+1NrqJCpJC1bBWtzc8uk4xVKMx9uH2b/3GASxjONTz2D4kX3G37
   aDkPulEfjm72R8ZLEd0TfNsc1Uuw2pnxHHd/vH7bUM1Y+T3qTLPIYY/Hj
   QC6UGicQvJK/f9mAvI5nwpw1esNf+WZni+zIqGqpfkbALocOiaxYbMocy
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: wYUqT4zFvHe43JS4YJiis1mBm8CtL1wLjyWeBj4RhzAX5HNIiBJvNURP5HqgG0mLqaR8I/763f
 xH8FuARomth3awvkv6UfyeBcRvYfqkUMSbJ5Aqs/mBUIdPXLqwcWFrySDjEywSLFPiTPMA9/n4
 qAbpikjsEiWd3P23IlV//JoH2g1oEl9ws/8SW4l/ZRzs8OLMjDWAWhzDiUgpV8qoVN3+ory5Pd
 HgIQfJgESj7Iut0vGgikRbXQXH3IggyXPjbUz06jkfNC5Mpwe/KsAqcZ3wdmWAz8ucBzUA5Zyy
 TDRWsMYZ38l7W+TlfIU/E8XZ
X-SBRS: 5.1
X-MesageID: 63486111
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:EsczIKwi42d8dd0GwcB6t+fVwSrEfRIJ4+MujC+fZmUNrF6WrkUCn
 GQWW2/Taa6JYjGjeNx1aoq18xsHv5Lcn9JmSARk+yAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wbZk2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt9tam
 PJVs4Dpcxw0DPPsnu8Ra0R1QxgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVorusuK9PkMcUzp3dkxCnxBvc6W5HTBa7N4Le02R9u3ZweQ6+HP
 qL1bxIzdDjFURtfO2sbGaJlmN+FiFjwYTxH/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 nLL+SH1Dw8XMPSbyCGZ6TS8i+nXhyT5VYkOUrqi+ZZConee22gSAx0+TkagrL+yjUvWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKalhU3C/1IFfFj0hqQ+PT05Q2VPjUpHgcUPbTKq/QKbTAt0
 1aImfbgCjpurKCZRBqhy1uEkd+hEXNLdDFfPEfoWSNAuoC++99r0nojW/4+SPbdszHjJd3nL
 9lmRgAajq5bs8ME3r7TEbvv02P1/cihouLYC2zqsoOZAuFROdbNi2+AswGzARN8wGCxFATpU
 J8swJD20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4MvGkmfBg2bJ5YKVcFh
 XM/XysLufe/21PxNcdKj3+ZUZx2ncAM6/y5PhwrUja+SscoL1LWlM2fTUWRw3rsgCARfVIXY
 v+mnTKXJS9CU8xPlWPuL89EiOND7n1ulAv7GMGgpzz6gOX2TCDOE98tbgDRBt3VGYvZ+W05B
 f4EbJDUo/ieOcWjChTqHXk7dwxTfSNlVMyp96S6tIere2JbJY3oMNeIqZsJcI15haVF0ODO+
 3C2QEhDz1Tjw3bALG23hrpLMdsDhL5z8iA2OzICJ1Gt1yRxaIqj9v5HJZA2YaMm5KpoyvstF
 6sJfMCJA/JuTDXb+mtCMcmh/dI6LBn71xiTOyeFYSQke8IyTQL+5dK5LBDk8zMDD3TruJJm8
 aGgzA7SXbEKWx9mUJTNcPuqwl7o5Sodlet+UlHmON5WfEmwooFmJzao1q08It0WKAWFzTyfj
 l7EDRAdrOjLgok07NiW2vzU89b3S7NzRxMIEXPa4LC6MTjh0lCimYIQAvyVeT39VX/v/Pnwb
 +ti0PyhYuYMm0xHstQgHu8zn74+/dbmu5RT0h9gQCfQd12uB75tfiuG0M1IuvEfz7NVo1LrC
 EeG+90cMrSVIsL1VlUWIVN9POiE0PgVnBjU7Og0fxqmtHMmouLfXBUAJQSIhQxcMKBxYdEsz
 uoWscIL7xCy10gxOdGcgyEIr2mBIxTsiUn8Wk321GMztjcW9w==
IronPort-HdrOrdr: A9a23:F9nIN6t9SPzWyQeG4XJ9yLyY7skC0oMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJh5o6H8BEGBKUmskKKceeEqTPmftXrdyReVxeZZnMrfKlzbamLDH4tmu5
 uIHJIOceEYYWIK7voSpTPIaerIo+P3sJxA592ut0uFJDsCA8oLjmdE40SgYzZLrWF9dMAE/f
 Gnl656Tk+bCBIqh7OAdx44tob41r/2vaOjRSRDKw8s6QGIgz/twqX9CQKk0hAXVC4K6as+8E
 De+jaJpZmLgrWe8FvxxmXT55NZlJ/K0d1YHvGBjcATN3HFlhuoXoJ8QLeP1QpF4t1HqWxa1e
 UkkS1QePib2EmhOF1dZiGdgjUI5Qxer0MKD2Xo2UcL7/aJHw7SQPAx+r6xOiGplXbI+usMjZ
 6jlljpx6Z/HFfOmj/w6MPPUAwvnk2ooWA6mepWlHBHV5ACAYUh57D2bCtuYeY99Q/Bmcga+d
 NVfYrhDTdtACenRmGcunMqzM2nX3w1EBvDSk8eutaN2zwTmHxi1UMXyMEWg39FrfsGOtV5zv
 WBNr4tmKBFT8cQY644DOAdQdGvAmiIRR7XKmqdLVnuCalCMXPQrJz85qkz+YiRCdE15Yp3nI
 6EXEJTtGY0dU6rAcqS3IdT+hSIW2m5VSSF8LAW23G4gMyLeFPGC1zwdLkeqbrWnxxEOLypZx
 +aAuMiP8Pe
X-IronPort-AV: E=Sophos;i="5.88,346,1635220800"; 
   d="scan'208";a="63486111"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZBOfeayyjK7541SFCw9puvDxqGARRF0xYVF7uJ1521Mf+nyG6qQBbtxKbQHoCgBU2Nsf6bg0rrEZDNNdhi0+JP01QV+ErWqyX7jOJ13MBdqhP3vO+WrPw38+frc7yDohn1aP+3emBFq/MDDg280jUZ3uuEVPXFVylDik6eOYlXHbmn/EewMsSOiAkv+fRgRoGfJh9w2ZLLJKq8vNzPgP7S/DRAML3a2SnCv2saMmZTGWen60+kmOL1VHrHz9frxG19XBrOVzn1aLQawCcOOYVtqtNLEg9SYNjsv1NFoTAed8OfmYgr9HqPbH89QOawmsorOv4vqhz9jyiR8xecrJww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VThZqsP0hF+BBVqsQwoAOJ1CnDhBpeqvJqFOhAvnfOc=;
 b=a3IzMIX7ezTMvErnbCrEUAHv2YULOxbyGvYERJP2Wvqxe5qrHTYTmqc2p8CGTg7++v012nF9wXPMcHs6n9g93y3ALSgA9AR9FZJov+MkJcjSOV7c8rUSuReT97SPFYPq/Xkbk9CNKEh9zCQnajRJVthBRRoBwB7rbBAA8hGCzJoGM0aGNeESFIEWEeKMVjTK9YIts8wJmf9wMRvmWoPl1JNt4NmTQ+WS2gxPL2uLs2Csf8tAqLoM1xIBgIYVM7Y0chrwtPgQcl85iQtInU/DQr7Dgokk2wbN8H53TI6lxq7YXQyPmd2NaKvILPxC2Z6iJOgfAW0Dx/7s7Yx+XMqbVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VThZqsP0hF+BBVqsQwoAOJ1CnDhBpeqvJqFOhAvnfOc=;
 b=bsqiKyCjeBSu/TV7RFKypH+BcD77+g/xvffzwFtm5kNr4kNftF2vu9g/dR3/SCFQwqzKlSumvvXnQNPEDbRT8CiQqgoLDnCW+Y8BZ0pnXt0adYlJxuJkTS5v7wRrP4M1aSHpXQe8j2DZzzLK6CZXV18Rhv2wJjDB98+GgVs1+0w=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>
Subject: Re: [PATCH 06/16] x86/mm: split set_identity_p2m_entry() into PV and
 HVM parts
Thread-Topic: [PATCH 06/16] x86/mm: split set_identity_p2m_entry() into PV and
 HVM parts
Thread-Index: AQHXcbgBTxDdyiQTqEquM7UvU49ReKyGxdMA
Date: Sat, 5 Feb 2022 21:09:16 +0000
Message-ID: <360968C5-AC73-435A-9AD1-63BCC0ED8EC6@citrix.com>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
 <90ea840a-0966-0cf8-39f0-f8ef3fb45786@suse.com>
In-Reply-To: <90ea840a-0966-0cf8-39f0-f8ef3fb45786@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 052d5c3e-9871-446f-e188-08d9e8ebc512
x-ms-traffictypediagnostic: SA0PR03MB5386:EE_
x-microsoft-antispam-prvs: <SA0PR03MB5386D6DB58608B45D584011A992A9@SA0PR03MB5386.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1824;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tSqCCO0DwGeicqNF+tGcg4MIQnc/mu5EEVU2y2aeNlbXVZdP0Kg0gwtjIZ/AHJCQb1g/kavW2B9jCSrFFOIcpRAcHBZXMuGDC72XUzr/PwhvVu9bzVzU5cZgbEeD5/vDmbOcb8YLsKfbeOmXgvutQYpvFj26DgvJLtkc4cBTsvilWkrfXIJkbDwEab37ZmK19D3APIqweQc+jqBIrSM+kxs41neA6rJxdtRNqTM4L5W7850z4ccV4bEWoj4DVKJTZFFmImEyvg7A3krki/pL9nuDEGbFPcbOMulALUDaDLW6FYIDhZNYHUzav3ELdGUKHJrjoc7jfKZxFsoAtu8wi533YA5G5AkRLWZOC2ptpWNc8QhRYNiWOaSECuAiuUQkKGSYbk8GTTWTI23DFfv+evmKB8aqJhgMe60ida/6UDPH4tEGtzF7QiC0YSbnddHZlA6+TXd/KbSff6MaM70Qy8mvyHeBnO7p6qtc0Yu/ikSF511QD0No1P8SgIVlkXh1+0Mn3hcSDfElwVP5ql5Pv4R17TWQhG7Wbq1PZDLGspJisTssJyBoUfXEqJJs5pECrr2WlJKYq0Es8pVmVwVifHsiC1rXGq5jCMbq0Mt2YGK9bPOsCNLCcTDihLiINqh3zwzdXL8lK7gvAcZGQWntCBE+pUinIRc9L0H8xoXz/zKlEQB5eMUsA3z9rkBprOSd2vKViDWtqHXy2v2tdLLSpORAZCxsbNqXsQ5Ys7QR83rYaGEZCN6DxNB9yj0C1j3qDMnxN2wGqJo2ujx71eEiVA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(186003)(122000001)(5660300002)(82960400001)(26005)(71200400001)(76116006)(36756003)(2616005)(508600001)(107886003)(38100700002)(33656002)(66476007)(6486002)(91956017)(8676002)(6512007)(8936002)(64756008)(54906003)(558084003)(38070700005)(66446008)(316002)(6916009)(66556008)(6506007)(66946007)(53546011)(86362001)(2906002)(70780200001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?f0hSVZFMvIXO2EVlIB9WDxS19ReFpiaHhYs4VIA7qVDNEDjDkIX3y/0YZDtA?=
 =?us-ascii?Q?rAsox2zbU488mqj6ATLB0XIbW4r2ZO0Rk6sHF8LMnJIRPQ0UEcwyW5TpsNKu?=
 =?us-ascii?Q?66oynPpiwvFamTboI59mZj73GG/dM0KbmiVgwZqhb7QNYh/PCTv4Qy+Gll/T?=
 =?us-ascii?Q?ZnmexrsReiVLY6oDQIlRMxYRZQqUTOQJ95w5VcqBBo7OJPlybNYpUSLXf7i6?=
 =?us-ascii?Q?XkN7vyLeQlaismGVB0gCunl61rOO225UoGqqzy4y83HYdzxIWPQBHrYGYx8H?=
 =?us-ascii?Q?INtPlvO4VIlWaMAh9EWjqrm4m8JA7oQ9FC0sJRH+IaXz8JuRKvxOv7p4bEDB?=
 =?us-ascii?Q?Ylrl1l6l8UGHf3e4fRT58p4sYvr2YBNqknkyndsMj6yv8Uy2XE29bz92hJxo?=
 =?us-ascii?Q?YWgtnZdqEMRX5CityRzqgJJozszDUc6+hJ+VxKBEJ1bAjo2nDRjFs2s8Wrh1?=
 =?us-ascii?Q?8u166HYvCEjAw1A1Ta7Rcf5vC+wBLKQYQEKJlZEJpsovvlyJPHg0gvLLe3Ui?=
 =?us-ascii?Q?I3OHDPqz9GYKstT5+Z0R24jZDNO4FCiQF1yiWfuAZCQStuwfu66BAAGXlv68?=
 =?us-ascii?Q?pGcYeSKlDpGGAaxMD5s+PLgvRext4MXOOeGFbIFf3d5oyErSiR6PMhu44mX+?=
 =?us-ascii?Q?e1HUkpbcL/yakwtGOJsAdbKsWQX+D/uM0m/zAUe+1ZERxXIsJqDIZu2dwZjH?=
 =?us-ascii?Q?oRHr0jMKMnloFNA27afJQc9nJnHfNX53ybeKJTBf78fQ05BVmUETGPPY0cFK?=
 =?us-ascii?Q?I1BowbaB0pPhF4D1SqTY17MevuheGZtQ9VAhGIbFdtMrr+lF3r5qeaaYOWSG?=
 =?us-ascii?Q?FSiqkZNwV6Q/POz5e41Vd83Nndg8vbhj4OQal6g1m4jJxDAp+r8SPapbMFWR?=
 =?us-ascii?Q?TL7gBBXjN9STRaFJr4t7BnnZeJy/vk2a4EaHbHKQx9n20ewcLLMYhDvxtZGo?=
 =?us-ascii?Q?6rm8fXKesf0vbHjfpFAjK0jGFcccPUec3xG/kBG+PCfTca8SvZf23SnNApYT?=
 =?us-ascii?Q?cv1/Sq3v9ncjy9FJhxuaWdEThWIPBNvKHIzG9yRDjuDd7K309z0HQwT2DAz4?=
 =?us-ascii?Q?Yhmn2WejBoMn0LKy/GsH8dP61McswHoOU4MnAmoHBQQp/D4jUyzH1tGe+n1c?=
 =?us-ascii?Q?u4eJkGqkkMg/QhOn0tQUZeEbqYGn+OTRmjktBVhh/75rlP0M0eTJEQi42DNJ?=
 =?us-ascii?Q?nX2lB0XGBQsoTf+CUffe0/Xzkxhk1Vx6ei5RTQMZB22ZakOtbYwMyaPoYGdt?=
 =?us-ascii?Q?mxmGK8GIgELK5Fdukwx4aG47kpssaqg5R8wa4zALYv7nM3Y/xd6Otj8aaVYh?=
 =?us-ascii?Q?lahHSQlNQSvTEK/mwLE84iwKMD6Qp6SU97M9MUAY5Gq+KvcHLXWy8xdBcLVb?=
 =?us-ascii?Q?4DvMjT9Fp3QDp9NTQhUOLw3hBnGAVTtF0b8bPC8MT8MOSGrUTgNyGv8LtnDW?=
 =?us-ascii?Q?F0/ylkahSYXMO4FSV4mKjcSfYmQSZrmF+mXEGbl0npZlr/YEkR6/RftL0yhl?=
 =?us-ascii?Q?MOKZwJddEiCpIxjkSC+BFORjFzNC5PJUoM5Q1VVcVtSgHro1GU1DnZdSPGGr?=
 =?us-ascii?Q?QR+qcdPxKpuHx/3acjtjr8Og6bH5P6wWYfZY4YNmMCR3c8rU7nyHpYzCiDbQ?=
 =?us-ascii?Q?kJZaIhDhHI7T8GKaSWVIPKT3LBdg1NCEEs2szVcTnRWrmvDXnusxzdy0g51x?=
 =?us-ascii?Q?+PNrEZ8B1dIJYqwOmvM1vOoc/PQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7F4212A9ABDBBC4A9FCE985ECADFC214@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 052d5c3e-9871-446f-e188-08d9e8ebc512
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2022 21:09:16.9849
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2CE/CaWgfpsnthS6ymnuvnVFq/oIZe96VIeZTr1MGOMl23v6LqhiB+CfWvQUSXQ3zK2hJZEd8TpuXQGV/UcADWyZV5yDEgHLZ6fdE003Ypg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5386
X-OriginatorOrg: citrix.com



> On Jul 5, 2021, at 5:07 PM, Jan Beulich <JBeulich@suse.com> wrote:
>=20
> ..., moving the former into the new physmap.c.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: George Dunlap <george.dunlap@ctirix.com>


