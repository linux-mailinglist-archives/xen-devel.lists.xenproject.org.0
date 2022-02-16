Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0434B85C9
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 11:31:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273935.469280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKHas-0008Hq-KE; Wed, 16 Feb 2022 10:31:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273935.469280; Wed, 16 Feb 2022 10:31:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKHas-0008Fc-Ec; Wed, 16 Feb 2022 10:31:30 +0000
Received: by outflank-mailman (input) for mailman id 273935;
 Wed, 16 Feb 2022 10:31:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oYE0=S7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nKHaq-0006Q9-NP
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 10:31:28 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98259578-8f13-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 11:31:27 +0100 (CET)
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
X-Inumbo-ID: 98259578-8f13-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645007487;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=KVCefupHgl8iFdyKIZI5zs9ugkHZAyHUnwwPql0iuFo=;
  b=V9HO7z9y8PiO9ppmYQsisY+je46MQnmiwboCEx7ixgzzmtlv45hYw0J5
   fgDseYoM5YeqTtl6cx71fLZV28dT2EfRsWeaXMfl9EJz5AzfQ1K/FNrXv
   5GANCsda5ob3nbYMC5l0hHzg+YyifygLrXMvcriwD6PkWJwSSVPQOqWqd
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: LthxVy3Hwp8STD4YSf3vcQJjZHGMS97ClxTWIh5IUC6RJxFlWH4iIsel9KiPpUZzCHt10sN1Hk
 esZC7vatKtESDd7d1H9WqEsaJvn1TTpjTU/UNelDpdRYT9pCs2kKEhIktdYSh1Qpv10zdwfm5t
 TTf1qk435/x/Y3+xd78ioqb8k5uND56y4PNSCOe1TCDGKNBp7u+P/uP1JbqLMvwp/xKSeezGrz
 /llCdYFo1Ta1uBV129s7qwGBwaRXqNhejcVA7liIQ2NAUuvQg1X8C5LSqu/sXyTGJzZepemT//
 0KqkE7Jr7yXh5pQVzTU81lr4
X-SBRS: 5.1
X-MesageID: 64324582
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:B3wBtq9ijiB1h3pxrU/CDrUDa3mTJUtcMsCJ2f8bNWPcYEJGY0x3z
 jYeXmyHMvyPZDGkfd5wPt6w/U4Gu8LXy4Q2TAVt/ng8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rg3NYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh84
 ux/lpaSFzsEI4aPw/0SShVCHSBxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGgGxq2p0eR54yY
 eIGTT50bTDjUyRgJ04OT44MrdiqumnWJmgwRFW9+vNsvjm7IBZK+LrnPcfRe9eKbd5IhUver
 WXDl0zmBjkKOdrZziCKmlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRokKhXs0FA
 00S9DAnoaU7+AqsVNaVYvGjiCfa5FhGAYMWSrBkrlHWokbJ3+qHLmUudwxiYv54iOIrbn9xz
 1CQk8nnBDM65dV5Vkmh3ruTqDqzPw0cImkDeTIIQGM53jXznG0gpkmRF4g+ScZZmvWwQGitm
 G7S8EDSkp1O1ZZj6kmtwbzQb9tATLDtRxV92AjYV3nNAuhRNN/8PNzABbQ2AJ99wGelorup4
 SBsdyu2trlm4XSxeMqlGrhl8FaBvavtDdEkqQQzd6TNDhz0k5JZQahe4StlOGBiOdsedDnib
 Sf74F0NuM4OZSH7PP4uOepd7vjGK4C6SLwJsdiOMLJzjmVZLlfbrEmCm2bMt4wSrKTcuf5mY
 srKGSpdJX0bFb5m3FKLqxQ1itcWKtQF7TqLH/jTlk3/uZLHPSL9YepVYTOmM7FihIvZ8Vq9z
 jqqH5bTo/mpeLalOXe/HE96BQ1iEEXX8ris+5wNLb/ceFM7cIzjYteIqY4cl0Vet/09vs/D/
 22nW18ez1z6hHbdLh6NZGwlY7TqNauTZ1piVcD1FVr3iXUlf6i166ITK8k+cbU9rbQxxv9oV
 fgVPc6HB60XGDjA/j0ca7j7rZBjK0v31V7fYXL9bWhtZYNkSizI5sTgIlnl+h4RA3flrsA5u
 bChiF/WGMJRWwR4Ac/KQ/uz1Fft72MFked/UhKQcNlecUnh6qZwLCn1gqNlKs0AM0yblDCby
 xyXEVETouyU+90599zAhKalqYa1ErQhQhoGTjeDtbvvbHvU5Guux4NEQd2kRzGFWTOm4rima
 MVU0+r4bK8NkmFVvtcuCL1s168/uYfi/ucI0gR+EXzXRF23Ebc8cGKe1MxCu6ARlL9UvQy6B
 hCG9tVAYOjbPcrkFBgaJRY/b/TF3vYRw2GA4fMwKUT8xSl24LvYDhkCY0jS0HRQfOlvLYco4
 eY9o8pHuQWwhy0jPsuCki0JpX+HKWYNUvl/u5wXaGMxZtHHFr2WjUTgNxLL
IronPort-HdrOrdr: A9a23:LFarF6/jX2G81IlLkK1uk+AiI+orL9Y04lQ7vn2ZKSY5TiVXra
 CTdZUgpHvJYVMqMk3I9uruBEDtex3hHP1OkOws1NWZLWrbUQKTRekP0WKL+Vbd8kbFh4xgPM
 lbEpSXCLfLfCVHZcSR2njFLz73quP3j5xBho3lvglQpRkBUdAG0+/gYDzraXGfQmN9dPwEPa
 vZ3OVrjRy6d08aa8yqb0N1JdQq97Xw5evbiQdtPW9e1DWz
X-IronPort-AV: E=Sophos;i="5.88,373,1635220800"; 
   d="scan'208";a="64324582"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gy3ojG65/3ycyR8hUILUqnRS4wjtamO5WafkAN25MnuyjjzC8/LhbFaMklPkWjcwNEcszzGjsvziodBR6aYIJ1b0MS4ZAcnbqvK1+V3DolCnqMRl4APgMweWHy3NugsROhUzSXRox3hbJ/CbTxmAGOQoiIO7h0hGg473crapK5WF3hhUFZ0IEJ1cpMIzFGqsWmBwI2+Kt0UGDcKdsmcEvuWpSx01RcaRlRMCe7yI7VRWAnLWPekU3nc2HzlZJ1K3cNJqb1vl1MkPRvIpqIWTADfmH8Y50Tc/sCoVKNpLvuEPdyvcvWRHWOihENeGGiQtesKKB7kd8BWgOk4FyTEE8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75VO+AU8QH9BrocEyWlwWVKugRCjMn/bwURNP9DnhoU=;
 b=hUi9WfY686v8Zx/hREPgGrgmCd2ZReXcy94bPAxZU4DU+P2yOPUXUjMpta6CdLDiX3tNtxGJD/ZK7DGHEAdekPBgddZ6JqLeGxEwjVZ87AnUewxMHPtsNB8o215r1HG6S+8lsqN5l8UFHh3Lew8BsHY01EuvzZcovC/QaDWcIEa545kcAeyfY2Ps6k4jGidFwbhlLYALRYhm/opfM0Y/83qskaos3hljpPRdErjrTrdJk2QKiu29HM1ZsZjSUMHy0mos5M0pcgqeLjNwhCaP/upM5ZBtLocNFPjNC/5lXqoe4/PL+/WIWo3iHCpOY2uM/LUlceVjJx4ft+24ra3vpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75VO+AU8QH9BrocEyWlwWVKugRCjMn/bwURNP9DnhoU=;
 b=r5eGgGtTzW95gYGRIcZbcRXIqEW2ueJo17jsSUOMF14+tI1Ld4LHfz5BCgDkWPzRi5r6WiLj70iWYXL6KwqvAI6a13FdHihPSRFGAtXMJFl2NkPlmKckn+KAleZNOS7/shsrMlqTxmOcLWtBUcUAZ2FVtvCk90WeEVHbB+57tJs=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <dwmw2@infradead.org>, Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 5/5] x86/cpuid: expose EXT_DEST_ID feature if supported
Date: Wed, 16 Feb 2022 11:30:26 +0100
Message-ID: <20220216103026.11533-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216103026.11533-1-roger.pau@citrix.com>
References: <20220216103026.11533-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0131.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::10) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97ff082c-8541-4ed1-23c9-08d9f13776e9
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6256:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB625612014BDEBA942933909E8F359@SJ0PR03MB6256.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ElJ9y0OO2Z/5hfcleDQHwhADR64BcfYyqqHIky+V05axd5LK5dV3O8Et6k6gtbywDL9UT8OPXJFKA7Hg55Oh4yZy/yu7OELNk1kiT+WlPHiA3pnDVf5XTdaw83uvW2JnM1lnAuUmr+XApCXxFnPXOJ46OeWrj87XDx7J9p2PTIPStZ3y179purMdn3utGnkWyJnXLq7UiYyZijKV4kxNuuWSCeltat7Up5H6CQRZpnXRR/LT52ijR+Lf6cDDEo7sq4F8OG72gb4q+NYBHxnoitOtIX9icamjuJRVYA76XSH/hdbCUH4QoNd9m3OQkrbulnsFM7s+xIYHM7Qp5rCYpr0he1VetcWS9psj11s6OQjgG3yOWKMrtnlLhnDVWUyvlkKSxJCJOEtEbuoBDYW05FjUWDPm2jci+wjNrSKboHAEBv6N+0pCwL9K+IdDO9gTKrI1AOHema0cLYcXixSFkybjocFp4qKc3ak8Nm1TIADtJSNSS/pP6nfvrJB3UXK/NWKi2fWEV3DS0MNIMZvvPleOBAvHWwRh1I2fUmXjlYhFFFK7RRv3h7PSPJr3+D1aMlF5yH3Ng3CIaPLsqqpnArCV2cnEQJwx3M3gvJincsQuwjqJl1zaq8lvFRlDzwsQuQDybhUJIbMhcBkrReRy/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(2616005)(66946007)(6506007)(6512007)(316002)(26005)(1076003)(66556008)(508600001)(86362001)(6486002)(6916009)(6666004)(54906003)(4744005)(82960400001)(66476007)(4326008)(38100700002)(36756003)(5660300002)(2906002)(8936002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VE53SXdxWmlWSkpTUWZ5dEkyTXlmMGx0M09sTXRIV0RPVWlobUhYV043Q3Ny?=
 =?utf-8?B?YkVxQ2Q5ZkF6c2E1ZklLV1F2VGFYa3FWZm9xNE5jdmt6U2t1elViZlFFbkVI?=
 =?utf-8?B?c1VSKzNLMEYzVmxpOW1CcGNmdldqc0w1SUFoWkUwOFZCZG1vR2ltRUEweFE1?=
 =?utf-8?B?TFFEaVpxZHBWNjBNUkhtWmlKeWJRT2I0Q1QvbElFbE1JUHZSTTlMUDgzU1c5?=
 =?utf-8?B?cUNtNnhneS85bEtYc2g2TWNUSHFUbkdLNXFPR3ZrUUl4YkRJV21HdVlqd2do?=
 =?utf-8?B?RVZ2WFV2WUZkSkN4dUNaYjcrOTc1bWI5aGUzSm14Ky9uZXFFMUpva3dzMWMw?=
 =?utf-8?B?SmtCSklxOFFKSGVmUzVHcEZzTmFMQTRmN1dLbmI2QTlGOXdqenRVeFdaMTJ2?=
 =?utf-8?B?QnJkNmRZTSsvNFFnanNmMVNnYmlFejRJZkp5TlBPMHlIOS9UMU9UOHVsMmQz?=
 =?utf-8?B?d2Z2OWt0T3NVRDRPVzRqUHZXTUlJV283K3czMEVaZXFuMUxNZkpjRHl2YStj?=
 =?utf-8?B?YjlJcHQ0Y295Mjh2MUxjbFhHQlhqQkdPNklWWW1SbXllWC9OQ1Qzb1g2dUd6?=
 =?utf-8?B?WXlabmxMN1BmWEk1R01udHNyQ25JcWc2SlQ3Ry95MUR0VDJwVzkyYVhFKzRX?=
 =?utf-8?B?UWlJR3VWZkpadzd6bThVNjBxdkNvOXBSY2pBOG5ERzNmVm1jTUd4ZVhYZVZt?=
 =?utf-8?B?azVZdXl6bGMrcC9xWmo0Y1d6WFJyWkFjZEluYUdGYlcxQWVLWXBIRjFKOS9u?=
 =?utf-8?B?d1NjVzVBVDNuWmQyVDY5Z3kxT3JzbzAwcHZlUy9yTUdEZEFzTG5zNXViODFj?=
 =?utf-8?B?ejROdy9SQTZJZU5aU25sdXRnWnFJeWFHVjdxcDA4R0s1Z0tEbVRWcFhlUVJC?=
 =?utf-8?B?alU3enN6KzRjaG1CYm8zZm12MCt6V3AxazhxZkNzUmpSRTRmak51cG1FbzVK?=
 =?utf-8?B?NFphRTJsMUZEeWxia1RoSXlwbkNLSllGTXFLeFRCVTB3dm53ZzRjZDRsOHg2?=
 =?utf-8?B?NHd5dG1RYkF4b2o1R24xTkEzY2pXMTEwSGc3MUphRTFnWmRPZ3FKSXo3MzFO?=
 =?utf-8?B?OFpJWHVDeGFNN0VJTzgvZ050V1F1R0pEWHR1UFR2RnZDdGxaUlZJYkNKMVBn?=
 =?utf-8?B?TVNGL2pPQ21HYXVBNXc3YXRaT2lHMTJ3bld0Q3RRZjhSNW0xWFZKQkNTdjUw?=
 =?utf-8?B?cFpuck9XUmZqWHVhOWxpZzJTbEtuVHNmRFdpV3dCZWZmejMyYzdFTnhFQ2dD?=
 =?utf-8?B?WFdIV3hZdnRsNnlWS1dNVzQvTDR4aTNRQXYyVGV3elhFMFBxZU1KNFh2VjN4?=
 =?utf-8?B?TUt6ZnJhQk1VVDc2aGVxaWgzY2x0R2JpeUE1TDVYR0lBaUFaUDdmRjdqVXlV?=
 =?utf-8?B?NnViWjRGSTRWTUhVcFgxd0pibTN6bWhxWUtTNWtNaGFORWoxKzIwbDRyUkZS?=
 =?utf-8?B?UUtaN0k5RDhRcU5ITFoyZWxTemZBUlJNN1plM1VUTW1WQkYwWDlYTldSVVJ4?=
 =?utf-8?B?OEFCb1hTN21JaXRVd1FpMWNINmJ1ZTB3RkQyMit3Q0s5WlFIY3RBRzNRMG5Y?=
 =?utf-8?B?V3ZEVkZEUWI5YnNsMU9VTTFLRXRuWEdrVmJaMThxOGUwUkdYRGVXTzRXSmg4?=
 =?utf-8?B?Q3BPRlh4Zmx6MTRSdjAycjRndWpya2lsZG43SXNaV0lYN3Ziemt2WkVSZndB?=
 =?utf-8?B?Qm9hZXhkUXRLWXZFQUNZUEtPdFphQWk0RENMUktsS2UyMFk2Znd2WFBmR1dE?=
 =?utf-8?B?ak1JSEFvOXJ4MnRqVHlqTGRtRGJ0aVlrV1MwQUo0cktZRFlFV3VBekg1V244?=
 =?utf-8?B?K0lWaVRpODYxaUxPSjIwWVNBNXFaTktISHdPb3JqZEdaVFhERFVnOE1FM2xS?=
 =?utf-8?B?UjZDcjJWSVNhME1KamZPZ3VaUjJiQXVBN2Iyem1GUWw4TjZ5ajZITzVLMFJa?=
 =?utf-8?B?V0Q5OER4aktmN1hIWUtjMmRweWwxTm9VeHVwVlV5VlNSaTRKMEJLc1lBMGgr?=
 =?utf-8?B?QVp4eE9Hc1hDVW1PSFRHV203RW9jdm1ZY0M0WkhobzZNOXZubi9KbVY2Z2Ri?=
 =?utf-8?B?bzE5c3lJbGtGRWNsNWtDR1lwNlRVVm5xNXpTMnQ4ZFkzNlFwMGNlOE4zQ2I5?=
 =?utf-8?B?YWJDTWI3VXo5VWlmbWhPZmxCWUtwdFozNEJOQ0RyVHBpWjJ3eVVuczV1VmhN?=
 =?utf-8?Q?oYjOoR6Ze9u64ptT0o5H8V4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97ff082c-8541-4ed1-23c9-08d9f13776e9
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 10:31:17.1058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fep66e4T7ZJttA4ygpzVmzXhvXPvob/iv0lNGE7js+c8HVIH9bEl4a5lqWCvxrLii1uFuhBDqvS8UhBl5UUXrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6256
X-OriginatorOrg: citrix.com

Expose the feature if available for the domain.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Note: con not be committed ahead of the rest of the series.
---
Changes since v1:
 - New in this version (split from previous patch).
---
 xen/arch/x86/traps.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 485bd66971..5b24688b07 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1150,6 +1150,9 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
         res->a |= XEN_HVM_CPUID_DOMID_PRESENT;
         res->c = d->domain_id;
 
+        if ( d->arch.ext_dest_id )
+            res->a |= XEN_HVM_CPUID_EXT_DEST_ID;
+
         break;
 
     case 5: /* PV-specific parameters */
-- 
2.34.1


