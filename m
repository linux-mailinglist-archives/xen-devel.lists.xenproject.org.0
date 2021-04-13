Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D56A735E0D8
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 16:03:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109836.209725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJds-0006ar-TS; Tue, 13 Apr 2021 14:03:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109836.209725; Tue, 13 Apr 2021 14:03:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJds-0006Zx-LV; Tue, 13 Apr 2021 14:03:48 +0000
Received: by outflank-mailman (input) for mailman id 109836;
 Tue, 13 Apr 2021 14:03:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=51M0=JK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lWJdr-0006KX-Bn
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 14:03:47 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c487b8b6-adbe-429a-bc33-38996c013ab6;
 Tue, 13 Apr 2021 14:03:46 +0000 (UTC)
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
X-Inumbo-ID: c487b8b6-adbe-429a-bc33-38996c013ab6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618322626;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=cq7WRx5BpsCYjEAJzUUXhgmQH5KGs74ng/5qh4MPnF4=;
  b=PY3XZBHfGoA7tdRr7tO2ZPJZrJSPmiDv+j2Ok28y8tm3YR1Uw7oDSG8j
   Jyc+AwqAB25N8PteJeU2YUpM2f90me5ZIRXaJMGFQ0gAGrARvpYBoGd3C
   g3dR0JfhZJcq+FOQBm2UL31coOoCemSiWNL84ukdCD5Ffl3xfWisU3wYq
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: xzoOk2dYXHI5sGJAd5bxzv5J5AgygmBVfQ1pUdlD+YkSHSsmqN3o7qAhg0mXGknDp3LqvPVAY3
 apgABNg3iyOhdj5uaJV0o9wBANuGLFM7WqM40QmgJRfC9IHA7RgcsZMR1IBiUvoq382qYt/UNR
 T4QEWK79eLxQqlW+QSUBtGkr5rQxQP7jW4I+Ik3rKV5cADXzDgqnTV44ncku254aojtPfGq1fw
 mvf2ltJG0N5kzhpj1bzKetMjxMFEFFi4H0PQxRGKc+exPmuWCkbe6FEr8p7K4FdSq7b3+nxSHw
 xW0=
X-SBRS: 5.2
X-MesageID: 41614008
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:PoNK06HcFfkz5oBxpLqFbZTXdLJzesId70hD6mlYcjYQWtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7Lk/03aVepa0cJ62rUgWjgmunK4l+8ZDvqgeNJwTXzcQY76
 tpdsFFZeHYJURmjMr8/QmzG8shxt7Cy6yzmeLC1R5WLD1CQYsI1XYcNi+wFEpqSA5aQacjHJ
 2H6cZd4xamc3IbbsO0b0N1I9TrjdvNiZ7gfFo6FwcqgTP+8A+AxZzbN1yj3hkYWy5S2rtKyw
 b4uiHw+6nLiYDc9jbyzGnWhq4m+ufJ6twGP8CUj9hQFzOEsHfSWK1Ee5mv+A84u/uu7lFCqq
 i9nz4FM95o433cOkGZyCGdojXI6zol53/8xVLwuxKKyqaYNVFKefZpvo5XfgDU7EAtprhHod
 h29lmUqoZNClf4lDn9juK4Ji1CrFa+onYpjIco/htieLYZAYUhyLA3zQd+FZcNGz/C84Y3EO
 ViJ9G03ocpTXqqK1/epWVh29qqQzAaGQqHWFELvoiv3yFRh20R9TpV+OUv2lM7sL4tQZhN4O
 rJdoxuibF1V8cTKYZwHv0IT8ebAnHEKCi8f166EBDCLuUqKnjNo5n47PEe/+exYqEFy5M0hd
 DoTE5YnXRaQTOvNeS+mLlwtjzdSmS0WjrgjutE4YJih7H6TL33dQWeVVEVlde6qfl3OLybZ9
 +DfLZtR9PzJ2rnHohEmyfkXYNJFHUYWMoJ/vkhXVajpd/KN53KuuTXfO27HsuuLR8UHkfERl
 cTVjn6I8tNqmqxXGXjvRTXU3TxPmzzlKgAVZTyzqw28swgJ4dMug8ahRCS/ceQMwBPtaQwYQ
 9bKLPjmaWrmHmu8Q/zniFUEysYKnwQzKTrUntMqwNPGVjza6w/t9KWfn0X+3ebOBllTYfzHB
 REr1p6vYK7RqbgixwKOpaCCCa3nnETrHWFQ9M3gauY//rofZs+E9IBQ6x+FQLCEjRvggZ0oG
 J/aAsJL3WvVQ/GuOGAttg5Fevff95zjEOAOshPs0/Ssk2auIUSXHcBZiWvVsSWmA4qYDJRij
 RKgugiqYvFvQzqBXo0gew+PlEJTGiMGrpJAD6IY5hulqnxdBt9SnqLgjKmmwg+E1CahHk6ty
 jEF2m5aPvLCl1StjRj3qHm/EhdW0+dc0hzA0oK+rFVJCDjgDJewOWLbq283y+tcVME2PgaKy
 yASyAVOBlSy9e+0wO1lD6OGW49/IgnOvXQAd0YAvfu80LoDLfNubANHvdS8pogCcvntfUTV/
 mDPyCSNzH1BooSqnqoj0dgHBMxjnYqkfnlgkK4qEe52WMyGvrULhBNQaoBL9SV8mjjQLKp3f
 xC/KYIlNr1Fl+0TNiMjZzzRXpkDDj4pGatVeEmqZxOp8sJxfNONqiedQGN7W1N2RU1Edz9m0
 wfSplq+bypAP4bQ+UiPwZiumcznNuBLEEXohX7L+83c1YqlWLaNbqyks31gItqJkWAoQfqUG
 PvixF1zrPgXyGZ06QdBL91CWNKaFIk4HAKxpLJS6TgTCGrffpE5ly0LzuUd6JcUrGMHfE1og
 xh69+F28+ReCyQ4nGcgRJLZoZP+X2gW8W8HUalHvNJ6cWzPRC0uZSRifTDxQvfeH+ccEQXhY
 pMaEwWYIBis1AZ/fIK+xn3bLf2rEIjm0ZZ+hd9mDfWq9Gb3Fs=
X-IronPort-AV: E=Sophos;i="5.82,219,1613451600"; 
   d="scan'208";a="41614008"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZOSJ6fs7Jda5qlJKKj1FRQheVCHhY02lQwEPzFZi5y7bl4SG4kqgvi+1VgkPDpWVhCCRCL56tZGsACXtYD3hF9tU9u4rMaokYpaqV0JweymuyUeWahY+HCEgKSVAgYPzCvPRQ2XyXSxWmIlHyRf2kLXfJoe11wZzGjQHMGiXncM30pRLEsiqs2ndE8LtcRilV/IE3dunNzlHmZV/TOEXrDmSDSdvfGOAqoEDXMnmryVSdxm0tz+Nv4Q8KDutGuPGmOeiS0BFPZGx4Y0QrCE+Ija8BY44QCjBhBfoIPHedFNUC/+9G1YvBex9F8k9mve4MZhV0ftLCzpswzDmt+1bag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfg3EpqS4Xb7uB8bCvTSbNySuLEELrQoy2D2h5/WPGY=;
 b=bKxJukOyvWIKNlL6ThxCezHRGUu0aASvCJN9Wwlsm4mhJ1NCyN3Kb6CoK1lM5loHO+Rz3+ly4+kA6A8zVVTV7aj7SqMQCMTDw14sESRTbhNx+tm40tH+hosKlRsKTaWyA1kDXesIQ1BeaCNJkNJVs67JOUET/uPfy0pZ4B6S4Itw00bWIIoqbpmoMadoNmT3xFqVeYWS311dtyrZzNiJsUDgtiLJXnVELNXLDiHTUlIkous3s/KT+XM/zn70MVz3exCA8VXJVj12odTUwi1nT6D/TNS957grtDiBduU8DBAlcEeOYjB/uLLPxK9lnLoWFMsncUismloYDF57oMYPlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfg3EpqS4Xb7uB8bCvTSbNySuLEELrQoy2D2h5/WPGY=;
 b=r2MA396HPbEKem0DYIL8tw+PEzo8w/8mWissdUQtIsS3unLfMorYieXtP4TPro/72MA/wUddLZWvUR4dqhhm1dt01dH8M37DAH+ASd6+qMh49sfMqh7hJMiXwm7pIJfpajpghzoiRuaXHOrsHRrroNqLY3Iayzx+WP3xeFCRkZI=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 19/21] libs/guest: apply a featureset into a cpu policy
Date: Tue, 13 Apr 2021 16:01:37 +0200
Message-ID: <20210413140140.73690-20-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210413140140.73690-1-roger.pau@citrix.com>
References: <20210413140140.73690-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0054.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c20a9d9-7e3b-4209-de21-08d8fe84f22c
X-MS-TrafficTypeDiagnostic: DM5PR03MB2969:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB29691E83F2FCDA0113F5A4DF8F4F9@DM5PR03MB2969.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eulKJr/ewBlWyflw6ePV2lqjWX3P+cnD3YBhymmCKOGwQs8NJW0D/Z/Zq8qgkvz2PNpxsa1aEgyYkootf71QKGwMbiqKlN5Bn/725TD3LKOGSVmSLDUMuwlVEqrrqbXiyBlWUo4+giD+EahfhgFLkEOQjA6mxH0qm/nYrC/9focEvHo9WSeq4q8hRFzr65+Gm/blsVKTC4xruyfGzN88QfuXTqY2CHpk5hkrB+tqTnTrK+9KPR9KfF6nqPcl6c2EvX3E+oJkZBCu8XIkDltBxmPRPknMe71puheHgQY4Ay/KYnXo7aVmjN/soH0JldcgM0AzJHUA2VrpTC4PKDTlbX8iiHelFnsB8M66BLXTMLCiyVhy6E6VlbgrHu5ktFsI1PkrFHjdT7zB/llJEtAxdxZ4I4FDyujSs6SX+ZPI5E43tuGkaoEeBUzNl/TK99CO9GrI+ZQ0835MzcZ6PcChJicsfbesOZ7/EtllGOrtpWgkYnt5zciGu0LUIbb0QtHmyGBEZpS7W3IvWBG916SvLyagJAfrBBirqo+9kejLSXw+Ea4buboCqU8+uN3jlPcoOsDVWh3rwKc8LEbfyAcxaUBLXjlgGHHx6cCzuWChjhc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(39850400004)(366004)(83380400001)(186003)(6496006)(316002)(2906002)(4326008)(36756003)(54906003)(6916009)(2616005)(6666004)(16526019)(26005)(478600001)(6486002)(1076003)(8676002)(8936002)(5660300002)(66556008)(66946007)(86362001)(66476007)(38100700002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ckMyanJqSGsrUDJXVzlMRjhsVVZ3SXNVWktJVHJpbXZGOU85bWp5aGs2blM0?=
 =?utf-8?B?OG5nVmtQRGVEUmFCNHh0VGJXRHUrZFlIcmZSOXFuRU51eitReVV0ayttWFph?=
 =?utf-8?B?U0dUdCtSclZyenE3SWgyYU9RalQrbVhqMk1yUEx6Z1NWK2hXNmpNRFVrN2I4?=
 =?utf-8?B?M0pJdlRzZWV5enJYcTZ1VGhEODhQTkd5UG91cW5sWWFmSXhZd0V0dDNWSmlU?=
 =?utf-8?B?cDRjeUNPSDllUVZScGRZVnRRNE5oYWJNQnBCVHdrOXZCOWVkVGNVVjFPdGZL?=
 =?utf-8?B?aVM2cXhyMHJXa3JhTElVUERiNWtuUmJSV2tBa0RmT2VjcDhiVldWb3M0NFZQ?=
 =?utf-8?B?am5UUlgrQk5OY3hFVGJzaHhNcVp2dWJ3REsrdnRTejdTM3IzZFRVQkNheEl0?=
 =?utf-8?B?OWp4WXpXYTFTQnlaNXFJT0YySE1DZmlyUmpnRjhGZWNGQnpZbFAyWnV6bFJX?=
 =?utf-8?B?MEJuY1V4WGpMRDQ2RUw1ZFFoM3QvTlJ2ZzN1Qmg1Z0Q1NWgydEJVNXNybGxi?=
 =?utf-8?B?TEVKdEI5ejN2b1ZBNFcrcHZpR0d6VVArZmI5QTFObWNlQTdjb091VmJEL3Nx?=
 =?utf-8?B?UmQwUXlSWnpSZ3A1TFlGUVpwcmU2L0NrQ3ZkN2NUQUliWGtGaVZFclIvZkV4?=
 =?utf-8?B?bFZhczUxYTZWZmFKT3VoWk1KdWlKbDdyc1ZGZXp1RmZlSjdRS3IwNVlVSzBL?=
 =?utf-8?B?RlN6ZXBYV0draUYvYnIwUGJtU3ZwTmRyUWZIR3g3aE9ONVdKUGpSZStCc1p2?=
 =?utf-8?B?TFdMejBWUHdXZWxWTFF1ZVFPUjZHTmMyREVQa1Jic29BVnc0aFVGMFVOd3da?=
 =?utf-8?B?Znk0UCtNMXdTMlVLM2Zid0krOW5mMGRXWVdaM0tmeURNa0VmcVAybVdUKytT?=
 =?utf-8?B?OFlGOGU5U1VDZkpmREJBc3pHWkgvbjljQ09XSEFzdUt6SkkzUHI4Q01well3?=
 =?utf-8?B?TkdoQnFMblRyL0VSZ2Q1RUVXcDhqVThrMk9ubm1XVFRMbTNYaHVRN0JzVFp5?=
 =?utf-8?B?eWJ3VlIzYXhHOVRLUVB1SGNZNGZ1VHM4aVRIQzlJY040WDM5S0M5aEVOYncz?=
 =?utf-8?B?bWdBeng4SlpyYkRCSU9oYnJzMGxKb016ZVpDRExtNHVxZGJaWWZNVitrU01i?=
 =?utf-8?B?VDBpbFN3TUN5a1JzTk9hZ1NheVdOV1NxMlI3NlJ4Y2FaeGVVNlpOSG5Na2ND?=
 =?utf-8?B?aTFiZ3g1VTBldk1lQ3pLMU0zMVdtRnlDZ1dDeFJsa09nbFhkTnljREpIOFRk?=
 =?utf-8?B?Yk9XS0VqZXg0OEo5am1jRUFuVEhWdnZXajFiVjg0dXlvVlliMlBzeGdZZjBB?=
 =?utf-8?B?SllSOVFXMzU2a1Jwd2ltNzVCYU1HYVl4RlEwTDdyV2ZRdGtSUnpqNUdDS0x3?=
 =?utf-8?B?M1JqYmJvdmJqRkhXZ0FMQUxPMnpBZjRwekZLTFJlaW43QjAzcUpRNEdTcVBa?=
 =?utf-8?B?S2ZpRnlMMDlHTFJCSm1aeGY1d3kzREFSMFFtR1IzY0N5TXFhYjBvZ3NRSHZt?=
 =?utf-8?B?ZDNweEN2SnFUcmtGMEhVcVkvQS9UNVJ3akNHR2xWVCt4cGVDRFk4WFIrOEZG?=
 =?utf-8?B?TG5SUHN0TEt2TTZsRHJVQWV1Z3AzWGFTWmVvRkphSjhWK0NKZkZwY0x1aEkz?=
 =?utf-8?B?TFMxTnFCSUlSY3krMkJvbVo2ZDlwc0VpQW14cFc5LzdvL2RQY0hRRTlSaFkv?=
 =?utf-8?B?bE9HalNHSnNuTDZlN1owTDFCWWpmSHNSYkw2eFBKdk96RHhCLytPeE1pN3Q5?=
 =?utf-8?Q?jeBg3vTqYvYUSoP94Qvd0iBF7SDYpCd3cZsmd4z?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c20a9d9-7e3b-4209-de21-08d8fe84f22c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 14:03:42.6608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MGU0y1qrO/qX0kBv+NqlI6W64RCq9WKxlhAbOxFCYCU0d/e11g+HRSiRedo/mO39ayuhwYbksOS3bBvmeA3ZAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2969
X-OriginatorOrg: citrix.com

Pull out the code from xc_cpuid_apply_policy that applies a featureset
to a cpu policy and place it on it's own standalone function that's
part of the public interface.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/xenctrl.h         |  5 ++
 tools/libs/guest/xg_cpuid_x86.c | 95 ++++++++++++++++++++-------------
 2 files changed, 62 insertions(+), 38 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index ce0785f7654..3fef954d1d1 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2639,6 +2639,11 @@ int xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t policy,
 int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
                               const struct xc_xend_cpuid *cpuid, bool hvm);
 
+/* Apply a featureset to the policy. */
+int xc_cpu_policy_apply_featureset(xc_interface *xch, xc_cpu_policy_t policy,
+                                   const uint32_t *featureset,
+                                   unsigned int nr_features);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 06e3e8131d7..b0690d9799d 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -481,46 +481,15 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
 
     if ( featureset )
     {
-        uint32_t disabled_features[FEATURESET_NR_ENTRIES],
-            feat[FEATURESET_NR_ENTRIES] = {};
-        static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
-        unsigned int i, b;
-
-        /*
-         * The user supplied featureset may be shorter or longer than
-         * FEATURESET_NR_ENTRIES.  Shorter is fine, and we will zero-extend.
-         * Longer is fine, so long as it only padded with zeros.
-         */
-        unsigned int user_len = min(FEATURESET_NR_ENTRIES + 0u, nr_features);
-
-        /* Check for truncated set bits. */
-        rc = -EOPNOTSUPP;
-        for ( i = user_len; i < nr_features; ++i )
-            if ( featureset[i] != 0 )
-                goto out;
-
-        memcpy(feat, featureset, sizeof(*featureset) * user_len);
-
-        /* Disable deep dependencies of disabled features. */
-        for ( i = 0; i < ARRAY_SIZE(disabled_features); ++i )
-            disabled_features[i] = ~feat[i] & deep_features[i];
-
-        for ( b = 0; b < sizeof(disabled_features) * CHAR_BIT; ++b )
+        policy.cpuid = *p;
+        rc = xc_cpu_policy_apply_featureset(xch, &policy, featureset,
+                                            nr_features);
+        if ( rc )
         {
-            const uint32_t *dfs;
-
-            if ( !test_bit(b, disabled_features) ||
-                 !(dfs = x86_cpuid_lookup_deep_deps(b)) )
-                continue;
-
-            for ( i = 0; i < ARRAY_SIZE(disabled_features); ++i )
-            {
-                feat[i] &= ~dfs[i];
-                disabled_features[i] &= ~dfs[i];
-            }
+            ERROR("Failed to apply featureset to policy");
+            goto out;
         }
-
-        cpuid_featureset_to_policy(feat, p);
+        *p = policy.cpuid;
     }
     else
     {
@@ -1098,3 +1067,53 @@ int xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t policy,
 
     return 0;
 }
+
+int xc_cpu_policy_apply_featureset(xc_interface *xch, xc_cpu_policy_t policy,
+                                   const uint32_t *featureset,
+                                   unsigned int nr_features)
+{
+    uint32_t disabled_features[FEATURESET_NR_ENTRIES],
+        feat[FEATURESET_NR_ENTRIES] = {};
+    static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
+    unsigned int i, b;
+
+    /*
+     * The user supplied featureset may be shorter or longer than
+     * FEATURESET_NR_ENTRIES.  Shorter is fine, and we will zero-extend.
+     * Longer is fine, so long as it only padded with zeros.
+     */
+    unsigned int user_len = min(FEATURESET_NR_ENTRIES + 0u, nr_features);
+
+    /* Check for truncated set bits. */
+    for ( i = user_len; i < nr_features; ++i )
+        if ( featureset[i] != 0 )
+        {
+            errno = EOPNOTSUPP;
+            return -1;
+        }
+
+    memcpy(feat, featureset, sizeof(*featureset) * user_len);
+
+    /* Disable deep dependencies of disabled features. */
+    for ( i = 0; i < ARRAY_SIZE(disabled_features); ++i )
+        disabled_features[i] = ~feat[i] & deep_features[i];
+
+    for ( b = 0; b < sizeof(disabled_features) * CHAR_BIT; ++b )
+    {
+        const uint32_t *dfs;
+
+        if ( !test_bit(b, disabled_features) ||
+             !(dfs = x86_cpuid_lookup_deep_deps(b)) )
+            continue;
+
+        for ( i = 0; i < ARRAY_SIZE(disabled_features); ++i )
+        {
+            feat[i] &= ~dfs[i];
+            disabled_features[i] &= ~dfs[i];
+        }
+    }
+
+    cpuid_featureset_to_policy(feat, &policy->cpuid);
+
+    return 0;
+}
-- 
2.30.1


