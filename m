Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4BB4B8DC4
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 17:22:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274293.469746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKN4L-0005Nz-Tn; Wed, 16 Feb 2022 16:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274293.469746; Wed, 16 Feb 2022 16:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKN4L-0005KY-PL; Wed, 16 Feb 2022 16:22:17 +0000
Received: by outflank-mailman (input) for mailman id 274293;
 Wed, 16 Feb 2022 16:22:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oYE0=S7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nKN4K-0004NT-Ez
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 16:22:16 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 996356f7-8f44-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 17:22:15 +0100 (CET)
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
X-Inumbo-ID: 996356f7-8f44-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645028534;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=82IywCEJaGTDXuJv2gZ75axUySAXEkRmFEmzOfBUsd8=;
  b=ULcf3U67X/HhBDl7NBXz4QXE6doACD75ozmaIj1UtA9BFRYuzjiLEitf
   leJG61Pn6w6bkW9oo170UDqWNdSeF8xE04K9zB7RfH3JTDVZfifPPA7xq
   fe6i0c4nQ51vcO96Uy6klPEC7OwLdgahtt9trTdcgVNrWWdqU0M6dkW3H
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qGzaH+oGlJLizQdf4n0N3NDwTR6Aoh0kW3s8Lccd5JO12zx4JX+wVQg0K9hu8goepBbwTyu4I7
 K54amvK2yIb3EuC1DYqbfCVEZkTPKxzINRhVTq7/Scei9sZUt8XIZv/I3XnUv8tXjGww0UGIuI
 rOrVK8aZ01cx0ojNZFbWql/zrtMnMTWQgdwLNRrhamjvO5pIGlcEIrMLjwYY11122Qta+AUduD
 /aAvY/Xgf9B2BVbEflpi0ss/Z7V7iIsoYMm83uqrNzUDWiHlYUyABErFoioxAsJTXR5cSwbPmR
 F/1yjODNBRpF5dvqTQIS7Lho
X-SBRS: 5.1
X-MesageID: 66594733
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:MSHthK0Cyof1v3GUpPbD5VR2kn2cJEfYwER7XKvMYLTBsI5bp2EPx
 2ZKXWCFOfyCNGujet5/b9nk9RhXvZaEzIc3HAZspC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o5wrBh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhpc5e0
 IpvmpiLRhpqZLTCvcNNUSJWHHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6Diu4EFjWtv3Zsm8fD2b
 cAAcyhEMRX5eTYfBXUrWbwThve1vyyqG9FfgA3M/vdmi4TJ9yRzzbzsPdz9atGMA8JPkS6wv
 Xna9m70BhUbMt23yjef9H+owOjVkkvTR4Y6BLC+sPlwjzW71mEVTREbS1a/if24kVKlHcJSL
 VQO/SgjprR081akJvH/VRClpH+PvjYHRsFdVeY97WmwJrH8uljDQDJeF3gYNYJg5JReqSEWO
 kGhpc3GHWNNn7muRm/erK6aiBTiOxMbIjpXDcMbdjct797mqYA1qxvASNd/DaK45uHI9SHML
 yOi93Zn2ehK5SIf/+DipA2c3WrwznTcZlNtvm3qsnSZAhSVjWJPT6ih8hDl4PlJN+51pXHR7
 SFfy6ByAA3jZKxhdRBhos1QRNlFBN7faVUwZGKD+bF7qlxBHFb5IOhtDMlWfhsBDyr9UWaBj
 LXvkQ1Q/oRPG3ChcLV6ZYm8Y+xzk/S8RIm8DKGFP4MUCnSUSONh1HszDaJ39zqz+HXAbIllY
 cvLGSpSJSpy5VtbIMqeGL5GjO5DKtEWzmLPX5HrpylLIpLFDEN5vYwtaQPUBshgtfvsiFyMr
 753apvboz0CAbaWSnSGruYuwaUicCFT6Wbe8JcMKIZu42NORQkcNhMm6elxK9Y+zvsPz7qgE
 7PUchYw9WcTTEbvcG2iQntidKnuTdB4q3c6NjYrJlGmxz4oZoPH0UvVX8FuFVX+3OA8n/NyU
 dcffMCMXqZGRjjdomxPZpjhto1yMh+sgFvWbSaiZTE+eb9mRhDIpYC4Lle+qnFWA3rlr9Y6r
 p2hyhjfHcgJSTN9AZuEc/mo1V6w4yQQwbogQ0vSL9BPU0zw64w2eTfph/o6LphUexXOzzeXz
 SiMBhIcqbWfqoM56oCR16uFs52oA611GU8DRzvX6rO/NC/7+Gu/wNAfDLbULG6FDG6tofesf
 +RYyf34IcYrplcSvtouCatvwII/+8Dr++1QwDN7ESiZdF+sEL5hfCWLhJEdqq1Xy7ZFkgKqQ
 UbTqMJCMLCENc65Ql4cIA0pMraK2f0Ow2SA6P00JAPx5TNt/arBWkJXZkHehCtYJbpzEYUk3
 eZ+55JGt13h0kInYoSckyRZ12WQNXhRAawou6YTDJLvlgd2mEpJZobRC3Ou7ZyCAzmW3pLG/
 tNAaHL+uolh
IronPort-HdrOrdr: A9a23:+MO96a9f6G+Dp4JDZZ5uk+E0db1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc29qBTnhORICOgqTMyftWzd1ldAQ7sSi7cKrweQeREWldQtqp
 uIEZIOceEYZGIS5a2RgHjaLz9J+qj6zEnCv5a4854Cd3AOV0k2hD0JdzpzX3cGDTVuNN4cLt
 6x98BHrz2vdTA+adm6PGAMW6zmq8fQnJzrTBYaD1p/gTP+xg+A2frfKVy1zx0eWzRAzfML9n
 XEqRXw4uGGv+ugwhHR+mfP59B9mcfnyPFEGMuQ4/JlYgnEu0KNXsBMSreCtDc6rKWG70srqs
 DFp1MaM8F6+xrqDxWIiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FczPCgnBQ8O1U4e
 Zu5Sa0ppBXBRTPkGDW/N7TTSxnkUKyvD4LjfMTtXpCSoETAYUh4LD3xHklXqvoIRiKqbzOSI
 JVfYHhDbdtABmnhknizyZSKIfGZAVxIv+EKnJyz/B9nQIm3kyR9HFotfD3qE1whq7Ve6M0md
 gsDZ4Y5I2mNvVmFZ6VJN1xNvdfWVa9Ny4lDgqpUCfa/ec8Sjfwl6I=
X-IronPort-AV: E=Sophos;i="5.88,374,1635220800"; 
   d="scan'208";a="66594733"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X8aSQavogDgxfvmsjM1TwZmj6RAMMRo1Q+lyYGbMMtcZZ+buBI9HXAqM5fbjamfBnudnmS8hgbWxN8h0TXxUnc4sQSxe4LNJd5RoDYtgPtgvhY5jdYY5a125UGshNOdSapSudqQIRR1hOviRn/Q9RVJz3yfaPAapjFJoljS4OmycbM61fTNLo+bRCon7N+BNztShlvzVGiRNJylt+3N3RavA8z154gkSoTwTLbq9EtCM6FlQHjV36eI8g3uLAT97cKN6msFMJUdp82eQM75XrIv2/DfMcr/ZlU2Ve6COK2Extfuw6YnkNaBKbYhowBjKrITJxpwQ4UJTwUMeMn6IEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2JUejUh5yzqKtWUj7o1W9V/dctJs6neBQWjRyLXc7bc=;
 b=P76wra8HPaBySXFpiIZHq8L0kCgO+ABcBsqQvikZapNaIdhDNBC/24bcHp80Eav6g389p3OM9j4mw739BG/fFyOqIMlWT1om4gWQO8KxWPJnzByvFve+4DfHRYHj0bM4mzmOtZvQMa6VIF/wIGoiH9OFoTKIshTaNO+EzkUGxE9Ij1eB8PYOvhldjUQUk++LGijc31gZ4lRgc/AMo/xD2HwROA67wL447SAXoz62tBfrllIQWPQsG8cr+vbiMYYeJbea+PDyE2O0pklDM2BR7ilViOSeerUPQbym0vLBW/rC/CY7oeho7FbJpOhbEEZsyI5qb6VObJ/J6uA8qy1eYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JUejUh5yzqKtWUj7o1W9V/dctJs6neBQWjRyLXc7bc=;
 b=g1GjV/KTk6DNZswjMPhqE/OmGGa2FOCfQuRRzeK5Ox/KFq0b2YgASCiANkurVBhfDuoWsFKgspQSyiZH/hceeDd44ZGhlrOAIAlZk3sxjfaVAwv8zh5k85fPXQz8TPDNtdlZDlUL/6JA4tvlCkmPfcckKiWiV5fJDOMOaHzIrpE=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/3] retpoline: add clang support + Kconfig selectable
Date: Wed, 16 Feb 2022 17:21:39 +0100
Message-ID: <20220216162142.15384-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0016.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 463c500d-cbcf-4b95-a5f1-08d9f1686dfa
X-MS-TrafficTypeDiagnostic: SN6PR03MB4143:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB4143EDCAAFC9C745B15242128F359@SN6PR03MB4143.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2Kci9GkdqeQnDtOgpGWWNl6zFyfb0wkaDWEMu9+M7y1XaTSVr1jrGpWKzHKiqv0VFqyi+544TFmbyaXf9vaw5tHhYa9csQy+mDWctUtXPgaPWu1OgJug8RVpmKqy9m0iHdn7MRsiKxT+1HlEfJZlDXw0/rjDcbLMFHMrleABYEC8Sz8+aZI1XtD8374ziHmN+HL4cKC8b30d2EkC/NM54vdZ2fmDOUxrc36w4MFmsnxOJdQJtburZzgeGrwKSoTAzimS10UYGu4QlvufxD9nRlIsZ5dzSkUUl01VGYozcm80KYktI1wNg4D9qRdxidWVwVJMoS7cpm3oBPprMR9MCws2MD9T+PCSOn/HCchoTSiwxuvAtU3L+OKy/NIAioTA+nM/2a67Acu22piwp9kVxAW0YuJ6lY0L3EFrSU0Q6Cnv0XrVcPedx1MQdCO7eYfBeZPL69vfw6Oq+1jecFyiSKB83irt0Pwle7brEpde2ZEFOBcNQhnJ0eHN3k/3DeBw7B7FVv46qie558l77kclNPDZx61HlLLrhpaCTNqNRNGAzM4yZXYO8zK+QpPNGa6P+vGVZNlGGhduWj382ot+ZJqlVnQNzz9PP6aD9qgAU87jt0g8TSy/o51mSUtqw5hMUxg1r23h8WH1lClUwhQ0YA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6916009)(508600001)(4326008)(86362001)(1076003)(186003)(6506007)(316002)(8676002)(6512007)(66476007)(36756003)(2906002)(54906003)(5660300002)(83380400001)(6486002)(66556008)(2616005)(66946007)(26005)(6666004)(4744005)(8936002)(38100700002)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dG5UNmRTVXlzTE5idXVjQjd2SDgzVHlSUDVGbFluVk9abHpWdGhGSE0wWXZs?=
 =?utf-8?B?M25ZQ0tqOWhvaUxoNVRLUEFaSEl3NFVTZWVtZFlWNnl5cElTdXEwdnFTTnFz?=
 =?utf-8?B?cXplU0RyU2kzdUF1MkttUmJWTkJIT1FZYitFdWZJY3JlTTlWWnZZeVNFSWFm?=
 =?utf-8?B?Yis2QmRWSEltR0lCOGd4Qzk4OHlnazczZTlZWnZ0Wk8xRVFTZXdleW80UmRx?=
 =?utf-8?B?d3NQellEd1pOdjlKeHBwWFovLzFmREt1MUQ2N1ZLUGNzWSs0R0pySXhHTnVy?=
 =?utf-8?B?T0dzcXZDMkNhRVJqcmJXTVZkV3liVllHVUV5N1RZOUdjYXB2R0UreTJCcUtz?=
 =?utf-8?B?eXV5dGd1QWdhOE1IWk1uVTE5bXBnbWNEV2E4bnp4Tk40TVp1aXlIQWpOVmsy?=
 =?utf-8?B?WnZobHZkMzRHcVI0Rm90ckhla25qc1lxQzJBWGV0cFkvaTdFdGNUaHlaa0JN?=
 =?utf-8?B?TjUraWkySXBDdllReURyREFTTGRINFhDSkRiY0JRQm9tYzJZZW1nMXI1ajFK?=
 =?utf-8?B?d1ErSTY3RGNjOWltcVl4WjEvUHpHUkNHdktJLzdlZWhIdTNoV1RqcGdWSjlR?=
 =?utf-8?B?Tm9WUUl6N01mK3JTRDlaSEpEMmZIaS9RMjIvZXJrc3gvT0krOU5jUjBHWE9p?=
 =?utf-8?B?NVkxRUoya2tlWkNtdFpFbHdYSXdJZDdKNjVWMjYzUWJHaC9LQ0ErTFdqbW9x?=
 =?utf-8?B?cWZFZzdwcHF4c2FWanRqT3BHTW5LcHBqeGg0OTVZTmdjVjBsRGxlc0RoZm82?=
 =?utf-8?B?MkxvYmxaemx3Tzh2SG1wMXZLL1lNSUtmQ0FVbTNuditZSEFpV2lOTU1hOWdL?=
 =?utf-8?B?SWNvUmFHSmEwUE9PWU9VN3M2VkhqemM3M2Z2OExXcTVoelpTQjB4TFZPTXR6?=
 =?utf-8?B?SWpLT2F4UEVtaW85cHdxU2w2OHBkRndkOFNtV1lrbEJaMkpYWmh0Zko3dFA2?=
 =?utf-8?B?T1h0Q1hZbENtbFJuampaYmMrbEpVMG8xM1k2Tms1MkpvVVhGZHhXdG12aHlx?=
 =?utf-8?B?emtQSXJJOUtYVzdtWVB2V1kyMHF0K2lZVUVqZldIOXkyNnNxS0M0cUhoWDNH?=
 =?utf-8?B?TnR3TlJmWlBUVW1yU2pwY1UrYnJsc1phTzd6eS9aQzNmZkhwV0czWEE0MjRv?=
 =?utf-8?B?QzBBZ0F1WkM3TU1QM3ZQOHRrTmswZkJxb3Yya25ZVURhQWJIWjREdzRka0d0?=
 =?utf-8?B?UWNGMm5JTzdLVWhhLzZwbDJQRFdxZFJNZWxkR0pEUW5HUCtXMUcvOXZIdXN1?=
 =?utf-8?B?Zk1NeDQ1K1FiMlYreFRobVJqQzNZWklJMmRTQ1VCTDNuZ2xFVnN3OUZxMXlS?=
 =?utf-8?B?Z2xIb25scGlmNHRRem5uM004eXhPQVpNSHFlR2lnWGhFdnlPellxd2dhVms5?=
 =?utf-8?B?a3cyelRhVHRzYW5RejE1bks0U1I1ZXlhQkEva25hT0hCb1FVYlVJMmIwWXpk?=
 =?utf-8?B?SXhGNkt4NVZtY0lLbU9wS0N3MFNkZnM4WE11TWwzNU5ZTURBVlVROVlPd0xy?=
 =?utf-8?B?UlJra01aajJ4eWFWN2lPWEdGYnIyVGVjcUhqazJTM0tSZUU5clhCWVVNYnJh?=
 =?utf-8?B?NENVSHFwZXZDWVhFRk5Fd1ppSDhzdDRRdCtpOEVkODBwTStUV0l3bnJSN1U5?=
 =?utf-8?B?K05Tb2UxTjR1MHZPTCt5dDZ5YTltRTZDdXYwRjhXdXBQbXlYV3NJS0RzekV5?=
 =?utf-8?B?TEJuT3VuV25DZTZUSVl5dDgxNDl3cXlobHBGNG9EL0F6SXhHZVR0S0JWNmQ5?=
 =?utf-8?B?aUFId3FIQUFUbEZXcEZlN0RXY3dvbjRDOVdPOENFVStvSWYrTEJmcTh1TjBB?=
 =?utf-8?B?enNwaGRYZ0VJdjVhZkZrTzluSGhUN1JZZ3NmL0JMVHVyZGltYTZHaERrTFEw?=
 =?utf-8?B?eSs3c3g2d3dqT0lEUDVScTE3UUhlcktXRkZxakVaWnU3WGZzZDBpZUdtOTQw?=
 =?utf-8?B?Zy9UQmd1Uy9pTDlkTUxVZkNxMXliTXcrQ0IrUTV0QXpEanRiR3c1R2hSamYy?=
 =?utf-8?B?ak9lcTZNK0wwZ2xYUGZSaHRhWU5yUGRuTHJiN0hlTEp4aFZaRkxVL25YZWJy?=
 =?utf-8?B?UzZaeHBFMDljRzllcjJ6YjBGZjY0WUFZaUl1ems0QXdVSUNYNml0TmhLSWtC?=
 =?utf-8?B?MmJtYnpyeis0OUZGTHJVQ0FPRG5hRXhrVlJIc1NKd2s4UjRkdDdtZFMzREQ0?=
 =?utf-8?Q?5o+ZSSP8UxmdCONgqBI4h6I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 463c500d-cbcf-4b95-a5f1-08d9f1686dfa
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 16:21:47.5077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rbONISsoJjG00FeimFdKfD625fnDRnIKBal4+9YZXtlcJ4330QgDkafrlfCH2rFtNYPMR8W3YzjAqguij++3hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4143
X-OriginatorOrg: citrix.com

Hello,

The following series adds retpoline support for clang builds, and also
allows the user to select whether to enable retpoline support at build
time via a new Kconfig option.

I've tried adding a suitable description to the Kconfig option, but I'm
sure there's room for improvement.

Thanks, Roger.

Roger Pau Monne (3):
  x86/retpoline: rename retpoline Kconfig check to include GCC prefix
  x86/clang: add retpoline support
  x86/Kconfig: introduce option to select retpoline usage

 xen/arch/x86/Kconfig |  5 ++++-
 xen/arch/x86/arch.mk | 13 +++++++++----
 xen/common/Kconfig   | 16 ++++++++++++++++
 3 files changed, 29 insertions(+), 5 deletions(-)

-- 
2.34.1


