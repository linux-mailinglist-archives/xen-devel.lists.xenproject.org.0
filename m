Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47720461B19
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 16:37:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234671.407274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mriiC-0000dK-9W; Mon, 29 Nov 2021 15:37:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234671.407274; Mon, 29 Nov 2021 15:37:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mriiC-0000Zn-1x; Mon, 29 Nov 2021 15:37:00 +0000
Received: by outflank-mailman (input) for mailman id 234671;
 Mon, 29 Nov 2021 15:36:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PMap=QQ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mrihJ-0003uH-U1
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 15:36:06 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f03f85c-512a-11ec-b941-1df2895da90e;
 Mon, 29 Nov 2021 16:36:02 +0100 (CET)
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
X-Inumbo-ID: 0f03f85c-512a-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638200162;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=qFWoz5gDtG8uLFd4Mpr7eWgtMMa45L61vHQxGnnF2wg=;
  b=D4AL8OjYlWFj9tKF254CoBcwi7O8AktpcAAU2m+DpeP7O9KYvBkkuqmq
   KgO8qV82Xg2DkqCibI/muqCXtk1eSBTxiS2kUxX09TDEkMhM5mAWITm8E
   rqTi0t9mR3QxMTkDYIRp5/kVu6Yzo8qPaop3S0g+QbgsIroLXOTghoAxe
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VSEDlewqvHiy5wEI4xnrS+jJLXaFtow6FAD9YXv6OT6fB683qlORny6IZbqSucNBH1REs+JsHQ
 0IrBQ0uewPmzjsD5WUb2GAb6ppPfCS2YqHPLd3YtwY9seNNVxfC+cUBsPYcNPyhpMfMrzPNzl5
 qhGD3WtoNBUs/vDvI0apRUbmIvXsL5fzOVf3muuy6+He3arbXjr6eHrQB1EiLGEqKLbowXWp4a
 5IR6PrgZVzLF5TGuYVnEft+w8LsM30KNTdjMGGFoaYzujUFHGgVHfyJhr6YCMlQso84qgP0ZFh
 xm+Dv5NT2VcffhjCy4ACxlIK
X-SBRS: 5.1
X-MesageID: 58773282
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:nfBVkaI/GqRopLgAFE+RM5IlxSXFcZb7ZxGr2PjKsXjdYENShjZRm
 DNJCmmFbviLZWT2KosiaoS//RkOuZHUzNYwSAplqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Es5yrZg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2JvvVO6
 PlV76XtYkQ4Jo3rwuJecDdXRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2XtYAHh21g3KiiG978X
 I0mU2BJfC7GfgVKIUUwL4ASktu30yyXnzpw9wvO+PtfD3Lo5BN1+KjgNpzSYNPibcdahEGDv
 Urd4n/0RBodMbS32TeDt36hmOLLtSf6Q54JUq218OZwh1+ezXBVDwcZPXO6vvuRmkO4Q8hYK
 UEf5mwpt6dayaCwZoCjBVvi+ifC50NCHYoLewEn1O2T4qr1xjm5KnBed2NqK80+lOhsQ38J+
 FDcyrsFGgdTmLGSTHuc8JKdojWzJTUZIAc+WMMUcecWy4K9+d9u13ojWv4mSffo1YOtRVkc1
 hjT9HBm74j/m/LnwElSEbrvpzu37qbEQQcujuk8djL0t1gpDGJJimHB1LQ60RqiBNvBJrVil
 CJd8yR70AzpJcvT/BFhuM1XQNmUCw+taVUwe2JHEZg77CiK8HW+Z41W6zwWDB43aZZdI2O2O
 hSK6V85CHpv0J2CN/Ufj2WZUZpC8EQdPY69CqC8giRmP/CdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTCpfJS1yNEiT9xLvH711+eZynkgWnDqPLbimn0XP+efPPxa9FOZaWGZim8hktctoVi2Oq
 I0BXyZLoj0CONDDjt7/rdROcAtUdCdjXvgbaaV/L4a+H+avI0l4Y9f5yrI9YY112aNTk+bD5
 HamXUFEjlH4gBX6xc+iMy4LhGrHUcktoHQlEzYrOFr0iXEvbZz2tPUUdoctfKlh/+tmlKYmQ
 /4AcsSGI/JOVjWYpGhNMcij9NRvJEaxmAaDHyu5ezxjLZRucBPEp43/dQz1+ShQUifu7Zkio
 6et3x/wSIYYQ1gwF97fbf+ilgvjvXUUlO9ocVHPJ91fJBfl/IRwcnSjhf4rOcAcbx7Ew2LCh
 QqRBB4Zo8jLopM0r4aV1fzV8d/xHrInTERAHmTd4bKnDgXg/zKukd1aTeKFXTHBT2eoqq+sU
 vpYkqPnO/odkVcU74clS+R3zbgz7sfErqNBylg2B23CalmmB+8yInSC2sUT5KRByqUA5FmzU
 0OLvNJbJa+IKIXuF1tIfFgpaeGK1Pc1nDjO7KtqfBWmtXEvpLfXA19POxSsiTBGKOonOYwo9
 u4tpcoK5lHtkREtKNuH0nhZ+mnkwqbsiEn7WkX22LPWtzc=
IronPort-HdrOrdr: A9a23:r/7bVKEXFF5vzxDApLqFcpHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HlBEDmewKhyXcV2/htAV7GZmfbUQSTXedfBOfZsl/d8mjFh5VgPM
 RbAtlD4b/LfCFHZK/BiWHSebZQo6j2zEnrv5al854Ed3AVV0gK1XYfNu/0KDwSeOEQbqBJa6
 Z0q/A37QaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uHw9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy8QwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmjbf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnTC/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKprzPKN
 MeT/002cwmM29zNxvizyxSKZ2XLzsO9y69Mwg/Upf/6UkToJh7p3FosvD30E1ws67VcKM0ld
 gsBJ4Y442mfvVmHp6VO91xNPdfcla9OS4kEFjiaWgPR5t3cE4klfbMkcEIDaeRCdo18Kc=
X-IronPort-AV: E=Sophos;i="5.87,273,1631592000"; 
   d="scan'208";a="58773282"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYIhBJkAwm0eyQb6vsaMoPSdhUxYhexJSjgOMqurKRyr8qy/pXoJ9n4L+6V//ay1SucEXkGkng0gr2O129t/pKCtTl0GeEtZn9ipXMOiz5RlwS6Asf3Zo3+95NHImdTj/TZ7piOwWJlCFdWpTnMBl6Vw99jCpogItJbFeSnlAo4Mc4cLzPS+Ommco3zOvlPGyZjzDoMkYRVuB0eKDdAxwRSLgv3PN8xTG+Gaw/iWOJhZlE18ktWfxwtkrtfTnQ4sveybA8QSmU0bk/jcP/EB9I1YCpa5zLGK8WZttIFHJKJzDvKSQauiT+EqXQS2PFMllFGo0uBacv4nGrEiu/vYYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6x1WqcDI4hgAVUs2NwOsazyfVUvF37XffWCwKYbgUo=;
 b=jCeh0L1R6KQsC1a2YvVCA/ZOmRztdvr76rMAfI8fFE1RmtLCxgs3nrujPiEGE0RxYz+VnG0BN7FqnxfEX3I3DaAD5To6RDtMaDqk6Qpawf1Nf7l0vaxMrEEN2ah83PApdbffl37sSX77DQg4UdMCbDh4FJhLDFQB8z1cKsFm2juv0/r4lh++wdHITthCA2ioEdkOUeFvFqbYAhLleWgXgatxyw5yMyaJe3kBf3NGnXCyPrKahbNAWamFBN/6clzFhs1dFILwornXzyPE5C2T/TOedsAFZNFCbl8494jRwnWTzu2jbspqPSW5dWItMB5Vj61Fbc2ZdrLyQid7sPLC7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6x1WqcDI4hgAVUs2NwOsazyfVUvF37XffWCwKYbgUo=;
 b=l73qdabl7bv5wuopOIm2aSQs2EYCUPO+wF382bs8ZFcMJQnZgV3VhcDX6UHC3v5u81JYg7hhEhSLXEwK6Mj8qJ4d+rSdHviR+PWcivVOdigKc7cGYZKxFNsLeYwzWhuCGusZp6rQHosjlmKeVS1W9QVS/iLVoDcVGADTzMrPQVo=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v5 08/12] libs/guest: rework xc_cpuid_xend_policy
Date: Mon, 29 Nov 2021 16:33:51 +0100
Message-ID: <20211129153355.60338-9-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211129153355.60338-1-roger.pau@citrix.com>
References: <20211129153355.60338-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0076.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4cb5af70-2766-45b9-06cb-08d9b34de967
X-MS-TrafficTypeDiagnostic: DM5PR03MB2842:
X-Microsoft-Antispam-PRVS: <DM5PR03MB28423F9C2D8DD0FCACB2ED128F669@DM5PR03MB2842.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:65;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PvRsPdy5eFU3FGBEdPG2d3z5ew5+i7NSVIffFVV65VNI3DH9nBcJ82rG7KnvmGkfjnA9ANi2/tihdcwNgYnzzrv6yZS3EqmQmezF+tGyxn1otDhF47bkb/URhnJy9ppbeZkBER2f6KxETZKE5Vuitobt5d+WFQI7WG2JHuJPEW8s011LAVoJOiXcJqAmrjexfRgSPQAVqiPaA573yPr69Yx43iVGYzU+KTaxhS6s26jsJnzbjmmXmYeUF2TQJKMZ8r3wL/GBx2l1NoqfzwxmIU4047p3f6o0xLU7Dj+BjhEuXf7UcLFxzgQ2kBqbRg0TFTBbnpAhtkH+tZBBvW0l82xt6bDIA0KiT2LDcVvyoiHDL5x2X+xV1ohW3n/OcVi+mjjNSatoSh+Z/fhfrwrQk8gynNVJ1MH7f/E4izZJofZEJsa+Bx1eF3oRoyNzoKEADVze8pyJcFpyiIvKqCBYQlMxuq00HC7gHnVXUXrj7mUQAQjyxNtF5t+lliL9+TkDv8wu9hvkgnkvjclU1KG6ZeyxIai/sF+NaLAPfxIEesqsV31NmPVC5Y2zNyJEQ7xhWOH7Cq3oGssnDCSYNUXstsq+yv2cFJGckwh2Wz7PoDlhc5UtFTxE7Nh6J/ZrR0cTiBolFbgY8CtJK0OyEG0KLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(86362001)(54906003)(8936002)(2906002)(66946007)(6486002)(316002)(8676002)(956004)(6916009)(82960400001)(4326008)(6666004)(66476007)(66556008)(186003)(83380400001)(38100700002)(2616005)(26005)(508600001)(1076003)(36756003)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1RLTGFvSlZtYWw0OUU2eWpQMUhPNGpJWC9KcG90RVc0WWt3YnNBRHUzMW43?=
 =?utf-8?B?cE03K3ZpMkJjdyt6eUxSZDd1blRpM2MwOERjZlRrcFFCSWRHejJxZ1g4ekN6?=
 =?utf-8?B?YWpGY3R3MUhLNU1ab3lSNVc4TE5aUHp2TWViampZTXVESklFSEZiV0kzMCtL?=
 =?utf-8?B?WG9tcFB4eVFqaXA1REZpL0RvdUZpdlJOTVdVTS9UaFVYQ29WYm5hK1VDT2tY?=
 =?utf-8?B?RTVIZVd3Rmw1SDdkRnYzTW5lUlJ4Uk5hMDY0ZXJ0SS9NUWdNRmtCNmRPcmRi?=
 =?utf-8?B?RkoyUi9xS1dJRU1tV01sS3JsbXJ5QkRaZWhqVDdLb0NTdW5RN1BqVzFEamJy?=
 =?utf-8?B?eTNGVmJlOG1YalV6cEJmdHVlRE40YkQvMTRjd0JGZVd6V2xxMUhURldTQi9r?=
 =?utf-8?B?aHc5aTE1T2kzaWdyUC85dHpTWTRDUEtDdXZMK21vSU5YaGZuaWZVWW1hUExL?=
 =?utf-8?B?RHZCV0hWOUFWWXZmZHh3b09JUThCQW95cVFzUmovZlg3K2Q3Q0tXdHZFcjUz?=
 =?utf-8?B?djllc2FLb2hJMUNaWFIwbUk0SnVHY0dTbnMzTWp5dy9XNWZyNjRlQ2NCQ0xL?=
 =?utf-8?B?blBLYm01WkI2QmhxNUs1QmdncGtlUDNxTCtXT2FSbmhmdVdpTjBHUWhpbkhw?=
 =?utf-8?B?NlkyZXdMS3ArYTd6cjMxV3A4M21ITTNnTTRtbUI5SVpHZ3BIamo0NEV3L0FQ?=
 =?utf-8?B?U2d0MXdOV09lLzNwbGJncjIveFU2Y1BJaEU4NnN4Q0xjNlNEdkpnQlBmVjlR?=
 =?utf-8?B?MUF1TXVIeFhtV3FRd0daOWUxeFFzeGF0b3NuRkY1T1k4S2hoSW1uU0VHQkpz?=
 =?utf-8?B?L2ZjeFZyRHY3Y2lsUExERkRDcEJTbkdkNDR0NDNNSzJnakVqdmNpMlVWVkdJ?=
 =?utf-8?B?S2pKamtES0tsR1NvMXV2ZXBmQU8wcTZyMVZqRlZ5VitkQUFvN3hXZDdNOVp0?=
 =?utf-8?B?Tk1ObmpBNDlPeXpRMWpKSm4zZU1sL1BybnhLWjloc3JIaUx2MWc0UFJNK1I3?=
 =?utf-8?B?eGVoM211R1Rpdit5WEFXU255QkRkUWwzbGUxSnRkcUEzVDRwaDFOQmJndWFE?=
 =?utf-8?B?UzQwbWhVVklyMnNhTW0zckJ4UDZnWEx0MDllcVdOUGhNSVdwellLeXBNWkJJ?=
 =?utf-8?B?bFRZTnFBWFFuNGtEbld1WFo3L200TzlKdGx0ZWV1WjFZM3h0TU5EaFI2cEFO?=
 =?utf-8?B?U3N1cTNlZnN0SE03Z2M5eDY3R0tmSGJtcEdCNGtySS9pZThHcXhmN05rL1ZF?=
 =?utf-8?B?ZW5kUWhsNFNLYUx2YVN2VmgzS0w1M2dXNmQ5cEk2NmZVdEx0bWloS3VKQ3p3?=
 =?utf-8?B?dkJNRDFhQmxsa2N0ODhyL0tob29mZUd0MzdVS01nVW5NSnllVzlGUmh1V2Iw?=
 =?utf-8?B?M0Rwa3dsWlloanV0UjQyZTBrdGE1Z3FYSjdCREd4RmczOCtYL1dNNDQzVDhi?=
 =?utf-8?B?VFJhWk4xMzd2UkNYbDU2WlVpSjBpM3NLWEpkU3Fjb0lwbkF6TGtIS2xVQ0Ja?=
 =?utf-8?B?bnlLTEsvUHg2aXBKS3VvczA1RFQzOVFPR0Jrb3FrcURxYmlIMW5QMzUyZGRJ?=
 =?utf-8?B?N2JDdHdqNzRuZXJqMVdDUUpsUkR1YXF0djdNajFLdXBwL1NCVGE2WWhHUGFn?=
 =?utf-8?B?bG41WDZCWGFCeDBnenpoODV3NmdUZHk1S2ZmR1M2am1LYUEzamhBaXl1ZWRH?=
 =?utf-8?B?ZFF4dEZ5Zm55VklQbWF2Tm9CWnM2UldsWDR6cGJpRGxiZStYL0NvNy8rd05J?=
 =?utf-8?B?cTN5VFNITGJQVlg1ZEU0UHRhSXNzK2JPWWdZWDkzblg5RXExWUhOMEpyN2cx?=
 =?utf-8?B?SERkR1VpRXo0U2pndzVnQjZoUGNZYzdTRFpZZ1VDcFRNbXdTdUdPS3lTSzlX?=
 =?utf-8?B?WHRTN3pWTTRoc0RaWWtoc0ZKejdib0p4WUV6VzFVU2dLZkhIcHlPUnQ0OTBK?=
 =?utf-8?B?VWFpY1Q1c293M2VVaTU1K0FpMTlRVXZET0l1S0VITGM2Sm1zSFAvWjhvcERV?=
 =?utf-8?B?b21hZlFwenFWTk1HdFF1VjYvVGZLYWZhbjNTU3dMR2N4RkJWMWU5UW5IaERk?=
 =?utf-8?B?UnllcUtkSlR3MGtPYjZZUVo0cEIxSzhLNGpuRG9BNkpoekk5a0VIRmMvVE5B?=
 =?utf-8?B?cEVkUHdsRWluQ3h1YzYxQlp1SHVWNEd5MUVIcHk1MGVVUDBzVTJDZzEzbzV3?=
 =?utf-8?Q?JPS1JPG9qLUQwPaPggJsi7U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cb5af70-2766-45b9-06cb-08d9b34de967
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 15:35:46.0437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sIHR2gF+jn97kSYPDEAYxxQ7CUS/tK7QBaxLUJ2LKPC0u4ditQ4qP+Gd1QUbGyDKQQ2TyF0gun9KV5wRnovE/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2842
X-OriginatorOrg: citrix.com

Rename xc_cpuid_xend_policy to xc_cpu_policy_apply_cpuid and make it
public. Modify the function internally to use the new xc_cpu_policy_*
set of functions. Also don't apply the passed policy to a domain
directly, and instead modify the provided xc_cpu_policy_t. The caller
will be responsible of applying the modified cpu policy to the domain.

Note that further patches will end up removing this function, as the
callers should have the necessary helpers to modify an xc_cpu_policy_t
themselves.

The find_leaf helper and related comparison function is also removed,
as it's no longer needed to search for cpuid leafs as finding the
matching leaves is now done using xc_cpu_policy_get_cpuid.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Drop find_leaf and comparison helper.
---
 tools/include/xenguest.h        |   4 +
 tools/libs/guest/xg_cpuid_x86.c | 200 +++++++++++++-------------------
 2 files changed, 83 insertions(+), 121 deletions(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index bea02cb542..9912116a51 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -825,6 +825,10 @@ int xc_cpu_policy_make_compat_4_12(xc_interface *xch, xc_cpu_policy_t *policy,
 int xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t *policy,
                                   bool hvm);
 
+/* Apply an xc_xend_cpuid object to the policy. */
+int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
+                              const struct xc_xend_cpuid *cpuid, bool hvm);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index eafc1ec7c1..121bce1a92 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -254,144 +254,107 @@ int xc_set_domain_cpu_policy(xc_interface *xch, uint32_t domid,
     return ret;
 }
 
-static int compare_leaves(const void *l, const void *r)
-{
-    const xen_cpuid_leaf_t *lhs = l;
-    const xen_cpuid_leaf_t *rhs = r;
-
-    if ( lhs->leaf != rhs->leaf )
-        return lhs->leaf < rhs->leaf ? -1 : 1;
-
-    if ( lhs->subleaf != rhs->subleaf )
-        return lhs->subleaf < rhs->subleaf ? -1 : 1;
-
-    return 0;
-}
-
-static xen_cpuid_leaf_t *find_leaf(
-    xen_cpuid_leaf_t *leaves, unsigned int nr_leaves,
-    const struct xc_xend_cpuid *xend)
-{
-    const xen_cpuid_leaf_t key = { xend->leaf, xend->subleaf };
-
-    return bsearch(&key, leaves, nr_leaves, sizeof(*leaves), compare_leaves);
-}
-
-static int xc_cpuid_xend_policy(
-    xc_interface *xch, uint32_t domid, const struct xc_xend_cpuid *xend)
+int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
+                              const struct xc_xend_cpuid *cpuid, bool hvm)
 {
     int rc;
-    xc_dominfo_t di;
-    unsigned int nr_leaves, nr_msrs;
-    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
-    /*
-     * Three full policies.  The host, default for the domain type,
-     * and domain current.
-     */
-    xen_cpuid_leaf_t *host = NULL, *def = NULL, *cur = NULL;
-    unsigned int nr_host, nr_def, nr_cur;
+    xc_cpu_policy_t *host = NULL, *def = NULL;
 
-    if ( xc_domain_getinfo(xch, domid, 1, &di) != 1 ||
-         di.domid != domid )
-    {
-        ERROR("Failed to obtain d%d info", domid);
-        rc = -ESRCH;
-        goto fail;
-    }
-
-    rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
-    if ( rc )
-    {
-        PERROR("Failed to obtain policy info size");
-        rc = -errno;
-        goto fail;
-    }
-
-    rc = -ENOMEM;
-    if ( (host = calloc(nr_leaves, sizeof(*host))) == NULL ||
-         (def  = calloc(nr_leaves, sizeof(*def)))  == NULL ||
-         (cur  = calloc(nr_leaves, sizeof(*cur)))  == NULL )
-    {
-        ERROR("Unable to allocate memory for %u CPUID leaves", nr_leaves);
-        goto fail;
-    }
-
-    /* Get the domain's current policy. */
-    nr_msrs = 0;
-    nr_cur = nr_leaves;
-    rc = get_domain_cpu_policy(xch, domid, &nr_cur, cur, &nr_msrs, NULL);
-    if ( rc )
+    host = xc_cpu_policy_init();
+    def = xc_cpu_policy_init();
+    if ( !host || !def )
     {
-        PERROR("Failed to obtain d%d current policy", domid);
-        rc = -errno;
-        goto fail;
+        PERROR("Failed to init policies");
+        rc = -ENOMEM;
+        goto out;
     }
 
     /* Get the domain type's default policy. */
-    nr_msrs = 0;
-    nr_def = nr_leaves;
-    rc = get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
+    rc = xc_cpu_policy_get_system(xch, hvm ? XEN_SYSCTL_cpu_policy_hvm_default
                                            : XEN_SYSCTL_cpu_policy_pv_default,
-                               &nr_def, def, &nr_msrs, NULL);
+                                  def);
     if ( rc )
     {
-        PERROR("Failed to obtain %s def policy", di.hvm ? "hvm" : "pv");
-        rc = -errno;
-        goto fail;
+        PERROR("Failed to obtain %s def policy", hvm ? "hvm" : "pv");
+        goto out;
     }
 
     /* Get the host policy. */
-    nr_msrs = 0;
-    nr_host = nr_leaves;
-    rc = get_system_cpu_policy(xch, XEN_SYSCTL_cpu_policy_host,
-                               &nr_host, host, &nr_msrs, NULL);
+    rc = xc_cpu_policy_get_system(xch, XEN_SYSCTL_cpu_policy_host, host);
     if ( rc )
     {
         PERROR("Failed to obtain host policy");
-        rc = -errno;
-        goto fail;
+        goto out;
     }
 
     rc = -EINVAL;
-    for ( ; xend->leaf != XEN_CPUID_INPUT_UNUSED; ++xend )
+    for ( ; cpuid->leaf != XEN_CPUID_INPUT_UNUSED; ++cpuid )
     {
-        xen_cpuid_leaf_t *cur_leaf = find_leaf(cur, nr_cur, xend);
-        const xen_cpuid_leaf_t *def_leaf = find_leaf(def, nr_def, xend);
-        const xen_cpuid_leaf_t *host_leaf = find_leaf(host, nr_host, xend);
+        xen_cpuid_leaf_t cur_leaf;
+        xen_cpuid_leaf_t def_leaf;
+        xen_cpuid_leaf_t host_leaf;
 
-        if ( cur_leaf == NULL || def_leaf == NULL || host_leaf == NULL )
+        rc = xc_cpu_policy_get_cpuid(xch, policy, cpuid->leaf, cpuid->subleaf,
+                                     &cur_leaf);
+        if ( rc )
+        {
+            ERROR("Failed to get current policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            goto out;
+        }
+        rc = xc_cpu_policy_get_cpuid(xch, def, cpuid->leaf, cpuid->subleaf,
+                                     &def_leaf);
+        if ( rc )
+        {
+            ERROR("Failed to get def policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            goto out;
+        }
+        rc = xc_cpu_policy_get_cpuid(xch, host, cpuid->leaf, cpuid->subleaf,
+                                     &host_leaf);
+        if ( rc )
         {
-            ERROR("Missing leaf %#x, subleaf %#x", xend->leaf, xend->subleaf);
-            goto fail;
+            ERROR("Failed to get host policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            goto out;
         }
 
-        for ( unsigned int i = 0; i < ARRAY_SIZE(xend->policy); i++ )
+        for ( unsigned int i = 0; i < ARRAY_SIZE(cpuid->policy); i++ )
         {
-            uint32_t *cur_reg = &cur_leaf->a + i;
-            const uint32_t *def_reg = &def_leaf->a + i;
-            const uint32_t *host_reg = &host_leaf->a + i;
+            uint32_t *cur_reg = &cur_leaf.a + i;
+            const uint32_t *def_reg = &def_leaf.a + i;
+            const uint32_t *host_reg = &host_leaf.a + i;
 
-            if ( xend->policy[i] == NULL )
+            if ( cpuid->policy[i] == NULL )
                 continue;
 
             for ( unsigned int j = 0; j < 32; j++ )
             {
                 bool val;
 
-                if ( xend->policy[i][j] == '1' )
+                switch ( cpuid->policy[i][j] )
+                {
+                case '1':
                     val = true;
-                else if ( xend->policy[i][j] == '0' )
+                    break;
+
+                case '0':
                     val = false;
-                else if ( xend->policy[i][j] == 'x' )
+                    break;
+
+                case 'x':
                     val = test_bit(31 - j, def_reg);
-                else if ( xend->policy[i][j] == 'k' ||
-                          xend->policy[i][j] == 's' )
+                    break;
+
+                case 'k':
+                case 's':
                     val = test_bit(31 - j, host_reg);
-                else
-                {
+                    break;
+
+                default:
                     ERROR("Bad character '%c' in policy[%d] string '%s'",
-                          xend->policy[i][j], i, xend->policy[i]);
-                    goto fail;
+                          cpuid->policy[i][j], i, cpuid->policy[i]);
+                    goto out;
                 }
 
                 clear_bit(31 - j, cur_reg);
@@ -399,25 +362,19 @@ static int xc_cpuid_xend_policy(
                     set_bit(31 - j, cur_reg);
             }
         }
-    }
 
-    /* Feed the transformed currrent policy back up to Xen. */
-    rc = xc_set_domain_cpu_policy(xch, domid, nr_cur, cur, 0, NULL,
-                                  &err_leaf, &err_subleaf, &err_msr);
-    if ( rc )
-    {
-        PERROR("Failed to set d%d's policy (err leaf %#x, subleaf %#x, msr %#x)",
-               domid, err_leaf, err_subleaf, err_msr);
-        rc = -errno;
-        goto fail;
+        rc = xc_cpu_policy_update_cpuid(xch, policy, &cur_leaf, 1);
+        if ( rc )
+        {
+            PERROR("Failed to set policy leaf %#x subleaf %#x",
+                   cpuid->leaf, cpuid->subleaf);
+            goto out;
+        }
     }
 
-    /* Success! */
-
- fail:
-    free(cur);
-    free(def);
-    free(host);
+ out:
+    xc_cpu_policy_destroy(def);
+    xc_cpu_policy_destroy(host);
 
     return rc;
 }
@@ -425,7 +382,7 @@ static int xc_cpuid_xend_policy(
 int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
                           const uint32_t *featureset, unsigned int nr_features,
                           bool pae, bool itsc, bool nested_virt,
-                          const struct xc_xend_cpuid *xend)
+                          const struct xc_xend_cpuid *cpuid)
 {
     int rc;
     xc_dominfo_t di;
@@ -545,6 +502,10 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         goto out;
     *p = policy.cpuid;
 
+    rc = xc_cpu_policy_apply_cpuid(xch, &policy, cpuid, di.hvm);
+    if ( rc )
+        goto out;
+
     rc = x86_cpuid_copy_to_buffer(p, leaves, &nr_leaves);
     if ( rc )
     {
@@ -562,9 +523,6 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         goto out;
     }
 
-    if ( xend && (rc = xc_cpuid_xend_policy(xch, domid, xend)) )
-        goto out;
-
     rc = 0;
 
 out:
-- 
2.33.0


