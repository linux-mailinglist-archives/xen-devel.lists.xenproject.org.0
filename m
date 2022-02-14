Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 086EF4B4D45
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 12:11:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271424.465854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJZGQ-0006IP-E8; Mon, 14 Feb 2022 11:11:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271424.465854; Mon, 14 Feb 2022 11:11:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJZGQ-0006Eu-AY; Mon, 14 Feb 2022 11:11:26 +0000
Received: by outflank-mailman (input) for mailman id 271424;
 Mon, 14 Feb 2022 11:11:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jzps=S5=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nJZGO-0006Eo-E1
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 11:11:24 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6b568d5-8d86-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 12:11:22 +0100 (CET)
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
X-Inumbo-ID: d6b568d5-8d86-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644837082;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=3X5TbiYxIcmGeMsEYuWJowladoxgQEwdMVDxs5bkkzw=;
  b=YJfJQO9K2gyEkZNLK4tLCMXQN+zirinOrmzWdFw2WEy+8fXSIKsh0xxn
   5XzcInuZARChcMc7LsuXLihrI6tMLdQ4XxFa+jhWuDlrVXYThPchyMW6b
   vlEAebBc8QVg9Mwr1bUDk6b7UWjMWS+hvPFac8DOi509/yTEN6e5jPsrI
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: GxV0ZSIrcLEFptTL9rcORFpEVNHERXBkvMyjemQNxaarfDJHDrPDBOq27E81Wa/V/7pG9ak9YJ
 C9Ex6F61BdVnjzFqz34BlJikzOeUSG3i4Y1EmuLP3uKg2zW+kr/VWRyeAGZ6ms873pF3qUqvL/
 EMoD3nUd1RaLy0LfbS5f+REN8f5jAYWbvzMk6s0y62NCByF3oBUH1IdPSV/TKmMTelQcfeODCM
 bZO/3Rs5xedEQTcAt5HUoJMIN3nLBpNykT6vaPyzaZciah5c17YZAYcrVh2x/Z5VQPo721NPZK
 OCBBxyDyvPJ2bGd60iqsh8Ze
X-SBRS: 5.1
X-MesageID: 64043705
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:p5RdLaO8GJQvuufvrR2skcFynXyQoLVcMsEvi/4bfWQNrUp0hTVRn
 zcXWmGEbqyIYGD9fdFzbo619hgC7ZCHyYcxSQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En1500s/w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoz6Ao45/y
 tsKj8OxEVg5HrLRo6cMfiANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/uWvYMDg29t7ixINe3XO
 towNCBzVg7vWSQTalI4BrIBx8790xETdBUH8QnI9MLb+VP78gt117T8NcvPTfaDT85Vg0Wwq
 3rP+iLyBRRyHPubxDme+3SgnNjzjDj7U4IfEr6/3vNyiVjVzWsWYDU/T0e2pM6cm0G3Wt9BA
 0EM8y9opq83nGSxR9ngW1ujoXiLvjYVQd8WGOo/gCmHx7DI+Q+fCi4BRyRYdd09nMYsQHoh0
 Vrht8PkA3ljvaOYTVqZ96yItnWiNC4NN2gAaCQYCwwf7LHLh4U+jQnGSNp5J4ezgsfoAjH7w
 z2Mry8Wiq0aiIgA0KDT1VLNji+op5PJZhUo/QiRVWWghitif5KsbYGs7Vnd7N5DIZyfQ13Hu
 2IL8+Cc8eQPAJelhCGLBuIXE9mUC+2taWOGxwQ1Rt94qmrrqyXLkZ1sDC9WL05VbMgGd3jTP
 06L5hNx+4Jof2qHVPoiC26uMPgCwa/lHNXjc/nbaNtSf5R8HDO6EDFSiV24hD60zhV1+U0rE
 dLCKJv3Uy5GYUhy5GfuH48gPakXKjfSLI85bbTy1FyZ3LWXfxZ5op9VYQLVPojVAE5pyTg5E
 uqz1ePXkX2zs8WkO0E7FLL/ynhQcxAG6Wje8ZA/SwJ6ClMO9JsdI/HQ26g9XIdugr5YkOzFl
 lnkBBMElwqv2CCfcF7QApyGVF8IdcwhxU/XwAR2ZQr4s5TdSdrHAFgjm2sfIuB8qb0LIQ9cR
 PgZYcSQasmjuRyckwnxmaLV9dQ4HDzy3FrmF3P8PFAXIs4xLySUq4SMVla+q0Ez4t+f6JJWT
 0uIjViAH/Luhm1KUa7rVR5Y5w3t7CZNwLooByMl4LB7IS3RzWSjEASo5tcfKMAQMxTTgDyc0
 gedGxADoufR5YQy9bH0aWqs9u9FysNyQRhXGXf197GzOXWI92av29YYAu2JYSrcRCX//6D7P
 bdZyPT1MfsmmldWstUjT+Y3nPxmv9a/9aVHyglEHWnQawj5AL1XPXTbj9JEsbdAx+EFtFLuC
 F6P4NRTJZ6AJNjhTAwKPAMgY+najaMUlzDe4O4bOkL/4CMrrrOLXV8LZ0uHiTBHLaszO4Qgm
 L9ztMkT4g25qxwrLtfZ0XwEqzXSdiQNCvx1uIsbDYnnjhsQ5mtDOZGMWDXr5JyvaslXNhV4K
 DGjm6ef1a9XwVDPciRvGCGVj/Zdn5kHpDtD0EQGewaSgtPAi/I6gE9R/DAwQlgHxxlLybsua
 G1iNkkzLqSS5TZ4wsNEWjn0SQ1GARSY/G33ykcIyzKFHxX5CDSVIT1vI/uJ8WAY73lYL2pS8
 7yvwWr4VSrnIZPq1SwoVE858/HuQLSdLOEZdBxLyyhdI6QHXA==
IronPort-HdrOrdr: A9a23:VtdhAKxk4Je236DgXxQqKrPxtuskLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9wYhEdcdDpAtjnfZr5z+8J3WB3B8bfYOCGghrTEGgG1+rfKlLbakjDH4JmpM
 Ndmu1FeaLN5DtB/LbHCWuDYq4dKbC8mcjC74qurAYOcegpUdAa0+4QMHfrLqQcfng+OXNWLu
 v62iIRzADQB0j/I/7LTEUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K13zDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa3e
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0IXEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4Fi1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfusqsq+SWnqLEwxg1MfguBFBh8Ib1K7qwk5y4OoOgFt7TBEJxBy/r1aop8CnKhNPaWsqd
 60dZiAr4s+PPP+W5gNc9vpcfHHeVAlfii8RV56AW6XXJ3vaEi94KIe3t0OlZWXkdozvd0PpK
 g=
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64043705"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZjPLYZZmBwsobBDPx7+BH89dppX3eeuOjlikmoYzSlE5lA2kzIiXCPC1FYxPoNJpeJumwGTuYdmQ9n4trSZybB+lHw+J8lmrIqOuBFrRYP0STcCnFsRn46MpOb274uqDGnqhSe7US7iZtXBO0F2MlfNDD2aBtODOcSvpNls6D6QvDN1bg2nWRA+0prILBubP/Bi8zIVV6LylCSGqZr7VkbivoNMoq/Xbykwx6Te6spzQ6c1oCYdLU5ztZc3iZiwgfIAL6ZbSMPqjlW3neLM5JirsCvbZBgKgvZnToMgp7Aj3F6pyxd+oaxAR6bMU4ugWgjDi+jQJKRJ5q99yotLPxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AxbcAcIV1mqtbUwec8vq0aeTNEJjfjry4Um6tFjlGaM=;
 b=CZHI/tz8+5Zvizk3NLmgr54VBpk2+7dbUVxzP9NBdbTNnE7bn7o20Uxre7xZyk4P2Hy0nCIZRvUv3pYxqGUuCeB/z/6uk2g5vEbUWNaXc88oScA1dz2buANw8kNCTIo1u+wjExRdhE4NrM7jKe8JKIry10LgD6kSN87HzuX3OR5XUi/zVCgr+W79vYWssvQkFt1fHqDgeerWBfCoGFR7LGZEGC3Gw/jNtmStEFDMBjEwV8/fbj5++zpfOVN37rAu6fsOYLB84bESinMBZTGF4kYz9DvelFukW4DKy7QdhKxfF0GWsku5zQnoM6ObKG6n3Xad77edLYjSoCO88nXDCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AxbcAcIV1mqtbUwec8vq0aeTNEJjfjry4Um6tFjlGaM=;
 b=mFMlWN1WE7yy+5RhfF1h74h7zol7Jdiywq/k23m/g10V7d/QOJH2nArTKbX2q6zvlQo9aX0FeVM/C44I7zhuBHihFOHbenyLSqWznDS90S1AE0wz6um7MvldT+GEioZzXjYF+SZ6lf1yQEe54nA0L2KdJbweI6FBl10zBWMinLo=
Date: Mon, 14 Feb 2022 12:11:12 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>
Subject: Re: [PATCH] vpci: introduce per-domain lock to protect vpci structure
Message-ID: <Ygo40L4dMPJjZKRF@Air-de-Roger>
References: <20220209133627.959649-1-andr2000@gmail.com>
 <YgU6Snk8GTytJXZp@Air-de-Roger>
 <c4666570-666e-6680-5ec2-adf1da51ad06@epam.com>
 <YgZLEMW9US9QjjYG@Air-de-Roger>
 <33fb1095-64ed-29ef-ba6b-cbde21d941f8@epam.com>
 <YgowIg5MvTaf2zsR@Air-de-Roger>
 <d8389a90-00c8-b34a-8488-b0f3fc5bde1b@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8389a90-00c8-b34a-8488-b0f3fc5bde1b@epam.com>
X-ClientProxiedBy: LO4P123CA0344.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fb8e2f8-377a-4305-2ccc-08d9efaab827
X-MS-TrafficTypeDiagnostic: CO1PR03MB5729:EE_
X-Microsoft-Antispam-PRVS: <CO1PR03MB57295657D8AC19CAD9796F3B8F339@CO1PR03MB5729.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k2lFOSAKtx3UlkAXBovR2w3lUYNeTuPkkGVAFoJkD+rfWBkyN2KO3QTXVOcUDr7ZxUcOCjBi8OFVodYHTHny6ii3laoLr5J1GHyz81wPaHXmvEtEdkw+pRIsSIEIWCE8ah75udoYpG/eT9UJRubFK7JbOy9a2D2nKitYVIJd8/iGvp+lGtpvE/Fp8hA6yq1lfUhtIXyY8o1ODEEWSiuCnjkijG3CHYsq1xyCPiQBCkUgMfLKeqn/MfgGi8DIbavnOOWKbQvH9pm8/uVu4E3Y+/eva8MwniaPwBClKgEbddDphvotxyuB7nFf1ctnaY0k/6zEF60WMV7XqAHJQcR4E81R+VCrbEYUpJZXlBlMgrcyUUY+60cP9gfLu/EEGA9ssGJN9vvWrK1DU7TFRJ6RdGd68adTt3CkfhHitD+0U0Zl+Yngw+iScidkS2LVGq3AL+/5tp/Mrq34NnpvMXGhxrAW0u57B55dlaJ1ty6U7D9HNdXxMGpDMXfB94keGgbxa98nfckhPS5/7dg4nxCALv99/lx9frNcTA/Ot7X5yAppquZdpulwbJhjayrWk/ayGYctvWzB+SPhyqW/tE2bngXd+6g7U1pseOCNVXtbyuCfF/7yCN14imX0b08O8E9mQPwKiFa1nK1S9GRYa7Z1Kw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(38100700002)(33716001)(82960400001)(53546011)(6666004)(8936002)(66946007)(66556008)(6486002)(5660300002)(7416002)(8676002)(66476007)(508600001)(4326008)(6506007)(186003)(85182001)(26005)(86362001)(83380400001)(2906002)(316002)(54906003)(6916009)(9686003)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXVvdmEreEFwRGN0ZEQybkdFMUQ3aDdoSmcyRFYwbTZEa2JseXVjOHpZZUZI?=
 =?utf-8?B?NHVOb1RuenRjWnMrUzU5MndsZUFCQkM2U0FacURiS1R0QUFBVzE5VHE3RlBR?=
 =?utf-8?B?MFE1dlNKekZBeFpEUWxVb3N6ZEVmZ091NisxL29ZK2pRSEw4c1VBaG1rdG4y?=
 =?utf-8?B?c3lzQ29KUnJUais2L2lFTm1FNFhFUDVQT3dRQVpjc3ZuN01tWFZFV1hOdmVB?=
 =?utf-8?B?MTh0TFI5aTAzQ2tiZ3JSNzc0QW1tRmlsKytjSG0xYmtpUjZqbUM3aVZFTzBK?=
 =?utf-8?B?V08rejJlZFEzVXdtQm9xYnhWSFhSSnJzdDJkYWNRY3BZTWxRanViOE5Ib2sx?=
 =?utf-8?B?akwxcndNR2lVNUE1cmNPV2ZETk5SZGl6UjRpQUN3aEh0eVNRVFhheU1vTW1K?=
 =?utf-8?B?dUYvME1BYldkdVA2MC91ZzdIVnp5S1RjV3RMSUpKanUzQTIrR1FaWDhqY2Qy?=
 =?utf-8?B?YlhHMW4wczRQMWdCMWVLd1k5bzl5VWVSUUIwVDhOK0Rtcmd5ckJrMkpmUHNC?=
 =?utf-8?B?cHdJK29SZ1pUbTJMenl2RUl1Q2RyMEtpWFFWb3BFdDdHZmxVcGJxekx4Q2ow?=
 =?utf-8?B?U2J2bkF5WFRSWVRVcVdiZWViQ2VVdEs3K1lCdHRkZW0zenlCUzA4eXE5dC9N?=
 =?utf-8?B?UHJUck82d0k2aGFsbnNENUtGalJaK1dLMXYxTG8wbnJjTzFmMFJZS3ZxU0pk?=
 =?utf-8?B?NTJYZTVydXVYTEpXNHY1UVZpaXdCajhwTnE1S0Z3SG9OdXMxcXk0bWkxMFFl?=
 =?utf-8?B?UUEvV1JoQktYWG00ZFgvM09Da1FOa1ZQbTF1YUhVTk9hUzhmRUlISVdzeTJt?=
 =?utf-8?B?dnZ3dHFtOVMxR3dkU1p3QTdFdC9rdENnTWZvR0JVVmdpN0VOMFFKQzhOMi8y?=
 =?utf-8?B?aXhzNnI2dEdJTVplUk1FbXVFN3U0QmsxbFN6NFQ0ZFFGbkJESW9BU0JjeDR3?=
 =?utf-8?B?ZlBUWWRyNWxSNDVnS1VzNkxYVENneEQ5aWpFRlo5dW5raVdGWnF2ck1lYU04?=
 =?utf-8?B?SGlYZ1V5K0lUamZveGNZWlJuYzc4ZHpWWmJtTUxwUWFFY29Zb01RYmJGN3lY?=
 =?utf-8?B?TWJwM1lSYkdYbEdLZ20rdXVhRURUUDVZcmRlVVp1UU8wSFJZb250MUo4ZmpW?=
 =?utf-8?B?MGF4eG1yL3Z4SWhNNE84V0NpTFp4ZFpYejJBcFBIYSsrb01hR1hkVW1hTDd0?=
 =?utf-8?B?NkpxdzdVS2lqMjlUajhiT1BIbU81REpDbFBsS2VYd2dHZmNJMFhpS2NnZ056?=
 =?utf-8?B?TzlZdVFrbnhjcFoxd0J2SW9vTTQ3Y2JYaWlEV1g3R0t0WmNmUUtyVHgvWUc4?=
 =?utf-8?B?WmZyeU8xejBldWdNRjBnZ0wyN1VoOEtza0phTjdsb1hyWmppNHhPUVM0ZlVV?=
 =?utf-8?B?Z093U2drRDMydmk0OWlocmNZdmsyWi9hZGNRNlJWQ1N1MEM0cFhsK3ljTk5n?=
 =?utf-8?B?QmZmZXQzZVU0K3krY0Y2WEprbEFyRFJ2UkhWSGtzRjJxanY5U3QyeVpNbVZm?=
 =?utf-8?B?R0IvNWNwYUR4aXhoV1FCeDQxaW9kSHhYaG52Y2I0aTRYV2tOaVpxWUROakpO?=
 =?utf-8?B?bk04M09Sc0dZOXdnWTRHNzVzRWp5QXRFL1JUZDl3Y0lGR0syRHZZQlBjV092?=
 =?utf-8?B?N0RQd1dENURHT2pONFF4SlZOMEtvTVF1cFdqOHo5djd4aGZRMmxCcUlrNytw?=
 =?utf-8?B?dEhOckJSZWZqcFR4cUszaHJuYmZmajBnYUJTZndwM1NoNmRUTTNCdFJYbm1r?=
 =?utf-8?B?cEhaRVpPRlJNSkd6dVB0Y2VBWGg0TzNneUVtZ2oyaGsyamF5MTRJSUxMcU85?=
 =?utf-8?B?d2FFSElzamhwaVRDMzNpeENncVlQQnFTdjNaM24xSVBSZ2wzbFFaWENCL1Jk?=
 =?utf-8?B?b2RneTlBNzdEOXNkTVVQSlRTbGlpWWNnZVdZNEptaTRKVmhjckd0MVg5M3BH?=
 =?utf-8?B?cjI4OFh5SXp4MkRtVHBrbHRYcWFsZ29rQjRCNHg1QVVkb3JaMDhsZzJ5U0tR?=
 =?utf-8?B?ZG1JY2M1elh0NVNJdmFva3hWdkowekxhOGRtaGt0UUwwZ3AyWkJDMkNLMHcw?=
 =?utf-8?B?c0QrMUJjUGFOVWl5UTg4bVRTZUZ5STAzMlFxbjBYZGZnNm1WcTliSnZXc2pu?=
 =?utf-8?B?UjlZaWQrNXYwMUZKZ3JWclRQYnBxOUVuSnowcVFxazB3TUNGUTlCZEIxOEZp?=
 =?utf-8?Q?Zoq1g8Jr31M8YUV2mMr9vXk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fb8e2f8-377a-4305-2ccc-08d9efaab827
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 11:11:16.4408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FnnBnIwzMTV7Lhe9GqEGkUjCZhboDQVI06Pok7JtyS0px9gGL6bgocdlM03dq4USmHr6+hesnDu5DPRXkS12tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5729
X-OriginatorOrg: citrix.com

On Mon, Feb 14, 2022 at 10:53:43AM +0000, Oleksandr Andrushchenko wrote:
> 
> 
> On 14.02.22 12:34, Roger Pau Monné wrote:
> > On Mon, Feb 14, 2022 at 09:36:39AM +0000, Oleksandr Andrushchenko wrote:
> >>
> >> On 11.02.22 13:40, Roger Pau Monné wrote:
> >>> +
> >>>>>>         for ( i = 0; i < msix->max_entries; i++ )
> >>>>>>         {
> >>>>>>             const struct vpci_msix_entry *entry = &msix->entries[i];
> >>>>> Since this function is now called with the per-domain rwlock read
> >>>>> locked it's likely not appropriate to call process_pending_softirqs
> >>>>> while holding such lock (check below).
> >>>> You are right, as it is possible that:
> >>>>
> >>>> process_pending_softirqs -> vpci_process_pending -> read_lock
> >>>>
> >>>> Even more, vpci_process_pending may also
> >>>>
> >>>> read_unlock -> vpci_remove_device -> write_lock
> >>>>
> >>>> in its error path. So, any invocation of process_pending_softirqs
> >>>> must not hold d->vpci_rwlock at least.
> >>>>
> >>>> And also we need to check that pdev->vpci was not removed
> >>>> in between or *re-created*
> >>>>> We will likely need to re-iterate over the list of pdevs assigned to
> >>>>> the domain and assert that the pdev is still assigned to the same
> >>>>> domain.
> >>>> So, do you mean a pattern like the below should be used at all
> >>>> places where we need to call process_pending_softirqs?
> >>>>
> >>>> read_unlock
> >>>> process_pending_softirqs
> >>>> read_lock
> >>>> pdev = pci_get_pdev_by_domain(d, sbdf.seg, sbdf.bus, sbdf.devfn);
> >>>> if ( pdev && pdev->vpci && is_the_same_vpci(pdev->vpci) )
> >>>> <continue processing>
> >>> Something along those lines. You likely need to continue iterate using
> >>> for_each_pdev.
> >> How do we tell if pdev->vpci is the same? Jan has already brought
> >> this question before [1] and I was about to use some ID for that purpose:
> >> pdev->vpci->id = d->vpci_id++ and then we use pdev->vpci->id  for checks
> > Given this is a debug message I would be OK with just doing the
> > minimal checks to prevent Xen from crashing (ie: pdev->vpci exists)
> > and that the resume MSI entry is not past the current limit. Otherwise
> > just print a message and move on to the next device.
> Agree, I see no big issue (probably) if we are not able to print
> 
> How about this one:
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 809a6b4773e1..50373f04da82 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -171,10 +171,31 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>                               struct rangeset *mem, uint16_t cmd)
>   {
>       struct map_data data = { .d = d, .map = true };
> +    pci_sbdf_t sbdf = pdev->sbdf;
>       int rc;
> 
> + ASSERT(rw_is_write_locked(&pdev->domain->vpci_rwlock));
> +
>       while ( (rc = rangeset_consume_ranges(mem, map_range, &data)) == -ERESTART )
> +    {
> +
> +        /*
> +         * process_pending_softirqs may trigger vpci_process_pending which
> +         * may need to acquire pdev->domain->vpci_rwlock in read mode.
> +         */
> +        write_unlock(&pdev->domain->vpci_rwlock);
>           process_pending_softirqs();
> +        write_lock(&pdev->domain->vpci_rwlock);
> +
> +        /* Check if pdev still exists and vPCI was not removed or re-created. */
> +        if (pci_get_pdev_by_domain(d, sbdf.seg, sbdf.bus, sbdf.devfn) != pdev)
> +            if ( vpci is NOT the same )
> +            {
> +                rc = 0;
> +                break;
> +            }
> +    }
> +
>       rangeset_destroy(mem);
>       if ( !rc )
>           modify_decoding(pdev, cmd, false);
> 
> This one also wants process_pending_softirqs to run so it *might*
> want pdev and vpci checks. But at the same time apply_map runs
> at ( system_state < SYS_STATE_active ), so defer_map won't be
> running yet, thus no vpci_process_pending is possible yet (in terms
> it has something to do yet). So, I think we just need:
> 
>          write_unlock(&pdev->domain->vpci_rwlock);
>          process_pending_softirqs();
>          write_lock(&pdev->domain->vpci_rwlock);
> 
> and this should be enough

Given the context apply_map is called from (dom0 specific init code),
there's no need to check for the pdev to still exits, or whether vpci
has been recreated, as it's not possible. Just add a comment to
explicitly note that the context of the function is special, and thus
there's no possibility of either the device or vpci going away.

Thanks, Roger.

